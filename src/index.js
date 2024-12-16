export default {
	/**
	 * This is the standard fetch handler for a Cloudflare Worker
	 *
	 * @param {Request} request - The request submitted to the Worker from the client
	 * @param {Env} env - The interface to reference bindings declared in wrangler.toml
	 * @param {ExecutionContext} ctx - The execution context of the Worker
	 * @returns {Promise<Response>} The response to be sent back to the client
	 */
	async fetch(request, env, ctx) {
		if (new URL(request.url).pathname === '/quote/random') {
			return await handleQuoteRequest(request,env,ctx);
		}
		// Return a 404 response for any other URL
		return new Response('Not Found', { status: 404 });

	},
};

async function handleQuoteRequest(request,env,ctx) {
  try {
    // Fetch the random quote from ZenQuotes API
    const quoteResponse = await fetch('https://zenquotes.io/api/random');
    const quoteData = await quoteResponse.json();
	let quoteFromDb = null;
    if (quoteData.length === 0) {
	  console.error('No quote found', quoteResponse);
      return new Response('No quote found', { status: 404 });
    }
	let rateLimited = false;
	if (quoteData[0].q == "Too many requests. Obtain an auth key for unlimited access."){
		console.log("hit rate limit on https://zenquotes.io/api/random");
		quoteFromDb = await fetchRandomQuoteFromDatabase(env);
		rateLimited=true;
	}

    // Extract the quote data
    const quote =rateLimited? quoteFromDb[0].q: quoteData[0].q;
    const author = rateLimited? quoteFromDb[0].a : quoteData[0].a;
    const htmlQuote = rateLimited? quoteFromDb[0].h : quoteData[0].h;

    // Store the quote in the D1 database
	if (!rateLimited){
		await storeQuoteInDatabase(env, quote, author, htmlQuote);
	}

    // Return the quote in response
    return new Response(JSON.stringify({quote:quote, author:author, htmlQuote: htmlQuote}), {
		headers: {
			'Content-Type': 'application/json',
			'Access-Control-Allow-Origin': '*',  // Allow all domains
			'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',  // Allow these HTTP methods
			'Access-Control-Allow-Headers': 'Content-Type'  // Allow Content-Type header
		  }
    });
  } catch (error) {
    console.error('Error fetching or storing quote:', error);
    return new Response('Internal Server Error', { status: 500 });
  }
}

// Function to fetch a random quote from the D1 database
async function fetchRandomQuoteFromDatabase(env) {
	const query = `SELECT quote, author, html_quote FROM quotes ORDER BY RANDOM() LIMIT 1`;

	// Prepare and execute the query
	const result = await env.DB.prepare(query).first();
	if (!result) {
	  throw new Error('No quote found in the database');
	}

	return [{
	  q: result.quote,
	  a: result.author,
	  h: result.html_quote
	}];
  }

// Function to check if the quote already exists in the D1 database
async function isQuoteDuplicate(env, quote) {
	const query = `
		SELECT COUNT(*) as count
		FROM quotes
		WHERE quote = ?
	`;
	const stmt = env.DB.prepare(query);
	const result = await stmt.bind(quote).run();
	return result.count > 0;
}

// Modify the storeQuoteInDatabase function to check for duplicates
async function storeQuoteInDatabase(env, quote, author, htmlQuote) {
	if (await isQuoteDuplicate(env, quote)) {
		console.log('Duplicate quote found, not storing in database.');
		return;
	}

	const query = `
		INSERT INTO quotes (quote, author, html_quote, lang, url)
		VALUES (?, ?, ?, 'en', 'https://zenquotes.io/api/random')
	`;
	const stmt = env.DB.prepare(query);
	await stmt.bind(quote, author, htmlQuote).run();
}
