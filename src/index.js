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
		const url  = new URL(request.url);
		if (url.pathname === '/quote/random') {
			return await handleQuoteRequest(request,env,ctx);
		}else if(url.pathname === '/quote/test'){
			return await handleQuoteRequestFromDb(request,env,ctx);
		}else if(url.pathname === '/quote/test2'){
			return await handleBatch(request,env,ctx);
		}
		// Return a 404 response for any other URL
		return new Response('Not Found', { status: 404 });

	},
};

async function handleQuoteRequestFromDb(request,env,ctx) {
	try {

		let quoteFromDb = null;

		const startFetchDb = performance.now()
		quoteFromDb = await fetchRandomQuoteFromDatabase(env);
		const endFetchDb = performance.now()

		// Extract the quote data
		const quote = quoteFromDb[0].q ;
		const author =  quoteFromDb[0].a ;
		const htmlQuote = quoteFromDb[0].h;

		console.log(`fetch db time: ${(endFetchDb-startFetchDb).toFixed(2)}ms`)

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
async function handleBatch(request,env,ctx){

	try {
		// Fetch the random quote from ZenQuotes API
		const quoteResponse = await fetch('https://zenquotes.io/api/quotes');
		const quoteData = await quoteResponse.json();
		//console.log(`quotes length: ${quoteData.length}`)
		if (quoteData.length === 1) {
			console.error('rate limited', quoteData);
			return new Response('No quote found', { status: 404 });
		}
		let params = [];
		quoteData.forEach((quote) => {
			params.push(quote.q, quote.a, quote.h, 'en', 'https://zenquotes.io/api/quotes');
		});
		const value_q = "(?,?,?,?,?)";

		//insert all quotes into the database
		const startStoreDb = performance.now()
		const iterations = Math.ceil(quoteData.length*5/100);
		for (let i = 0; i < iterations; i++) {
			let data_left = Math.min((i+1)*100, quoteData.length*5)-i*100;
			//console.log(`data_left: ${data_left}, div: ${data_left/5}`);
			const values_q = new Array(data_left/5).fill(value_q).map(() => value_q).join(',');

			const query = 'INSERT INTO quotes (quote, author, html_quote, lang, url) VALUES '+values_q+' ON CONFLICT(quote) DO NOTHING;';
			//console.log(`query: ${query}`)
			const stmt = env.DB.prepare(query);
			const params_slice_begin = i*100;
			const params_slice_end = Math.min((i+1)*100, quoteData.length*5);
			let params_slice = params.slice(params_slice_begin,params_slice_end);
			//console.log(`params_slice_range: ${params_slice_begin} - ${params_slice_end}`)
			const status = await stmt.bind(...params_slice).run();
			//console.log(`status ${JSON.stringify(status)}`)
		}
		const endStoreDb = performance.now()

		console.log(`store db time: ${(endStoreDb-startStoreDb).toFixed(2)}ms`)
		// Return the quote in response

		return new Response(JSON.stringify(quoteData), {
			headers: {
				'Content-Type': 'application/json',
				'Access-Control-Allow-Origin': '*',  // Allow all domains
				'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',  // Allow these HTTP methods
				'Access-Control-Allow-Headers': 'Content-Type'  // Allow Content-Type header
			  }
		});
	}catch(error){
		console.error('Error fetching or storing quote:', error);
		return new Response('Internal Server Error', { status: 500 });
	}
}

async function handleQuoteRequest(request,env,ctx) {
  try {
	const startFetch = performance.now()
    // Fetch the random quote from ZenQuotes API
    const quoteResponse = await fetch('https://zenquotes.io/api/random');
	const endFetch = performance.now()

    const quoteData = await quoteResponse.json();
	let quoteFromDb = null;
    if (quoteData.length === 0) {
	  console.error('No quote found', quoteResponse);
      return new Response('No quote found', { status: 404 });
    }
	let rateLimited = false;
	const startFetchDb = performance.now()
	if (quoteData[0].q == "Too many requests. Obtain an auth key for unlimited access."){
		console.log("hit rate limit on https://zenquotes.io/api/random");
		quoteFromDb = await fetchRandomQuoteFromDatabase(env);
		rateLimited=true;
	}
	const endFetchDb = performance.now()

    // Extract the quote data
    const quote =rateLimited? quoteFromDb[0].q: quoteData[0].q;
    const author = rateLimited? quoteFromDb[0].a : quoteData[0].a;
    const htmlQuote = rateLimited? quoteFromDb[0].h : quoteData[0].h;

    // Store the quote in the D1 database
	const startStoreDb = performance.now()
	if (!rateLimited){
		await storeQuoteInDatabase(env, quote, author, htmlQuote);
	}
	const endStoreDb = performance.now()
	console.log(`fetch time: ${(endFetch-startFetch).toFixed(2)}ms, fetch db time: ${(endFetchDb-startFetchDb).toFixed(2)}ms, store db time: ${(endStoreDb-startStoreDb).toFixed(2)}ms`)

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

	const query = `
		INSERT INTO quotes (quote, author, html_quote, lang, url)
		VALUES (?, ?, ?, 'en', 'https://zenquotes.io/api/random')
		ON CONFLICT(quote) DO NOTHING;
	`;
	const stmt = env.DB.prepare(query);
	await stmt.bind(quote, author, htmlQuote).run();
}
