import { Hono } from "hono";
// This ensures c.env.DB is correctly typed
type Bindings = {
	DB: D1Database;
  };

const app = new Hono<{ Bindings: Bindings }>();

interface ZenQuote{
	q: string;
	a: string;
	h: string;
}
// Function to fetch a random quote from the D1 database
async function fetchRandomQuoteFromDatabase(env: Env):Promise<ZenQuote[]>  {
	const query = `SELECT quote, author, html_quote FROM quotes ORDER BY RANDOM() LIMIT 1`;

	// Prepare and execute the query
	const result = await env.DB.prepare(query).first();
	if (!result) {
	  throw new Error('No quote found in the database');
	}

	return [{
	  q: result.quote as string,
	  a: result.author as string,
	  h: result.html_quote as string
	}];
  }

app.get("/quote/test", async (c) => {
	try {
		let quoteFromDb = null;
		const startFetchDb = performance.now()
		quoteFromDb = await fetchRandomQuoteFromDatabase(c.env);
		const endFetchDb = performance.now()

		// Extract the quote data
		const quote = quoteFromDb[0].q ;
		const author =  quoteFromDb[0].a ;
		const htmlQuote = quoteFromDb[0].h;
		c.header('Content-Type', 'application/json');
		c.header('Access-Control-Allow-Origin', '*');  // Allow all domains
		c.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');  // Allow these HTTP methods
		c.header('Access-Control-Allow-Headers', 'Content-Type');  // Allow Content-Type header
		return c.json({quote:quote, author:author, htmlQuote: htmlQuote});
		console.log(`fetch db time: ${(endFetchDb-startFetchDb).toFixed(2)}ms`);
	  } catch (error) {
		console.error('Error fetching or storing quote:', error);
		return c.html('Internal Server Error', { status: 500 });
	  }
});

app.get("/quote/test2", async (c) => {
	try {
		// Fetch the random quote from ZenQuotes API
		const quoteResponse = await fetch('https://zenquotes.io/api/quotes');
		const quoteData: { q: string, a: string, h: string }[] = await quoteResponse.json();
		//console.log(`quotes length: ${quoteData.length}`)
		if (quoteData.length === 1) {
			console.error('rate limited', quoteData);
			return new Response('No quote found', { status: 404 });
		}
		let params:string[] = [];
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
			const stmt = c.env.DB.prepare(query);
			const params_slice_begin = i*100;
			const params_slice_end = Math.min((i+1)*100, quoteData.length*5);
			let params_slice: string[] = params.slice(params_slice_begin, params_slice_end);
			//console.log(`params_slice_range: ${params_slice_begin} - ${params_slice_end}`)
			const status = await stmt.bind(...params_slice).run();
			//console.log(`status ${JSON.stringify(status)}`)
		}
		const endStoreDb = performance.now()

		console.log(`store db time: ${(endStoreDb-startStoreDb).toFixed(2)}ms`)
		// Return the quote in response
		c.header('Content-Type', 'application/json');
		c.header('Access-Control-Allow-Origin', '*');  // Allow all domains
		c.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');  // Allow these HTTP methods
		c.header('Access-Control-Allow-Headers', 'Content-Type');  // Allow Content-Type header
		return c.json({quoteData});

	}catch(error){
		console.error('Error fetching or storing quote:', error);
		return c.html('Internal Server Error', { status: 500 });
	}
});

app.get("/quote/random", async (c) => {
  try {
	const startFetch = performance.now()
    // Fetch the random quote from ZenQuotes API
    const quoteResponse = await fetch('https://zenquotes.io/api/random');
	const endFetch = performance.now()

    const quoteData:ZenQuote[] = await quoteResponse.json();
	let quoteFromDb :ZenQuote[] = [];
    if (quoteData.length === 0) {
	  console.error('No quote found', quoteResponse);
      return new Response('No quote found', { status: 404 });
    }
	let rateLimited = false;
	const startFetchDb = performance.now()
	if (quoteData[0].q == "Too many requests. Obtain an auth key for unlimited access."){
		console.log("hit rate limit on https://zenquotes.io/api/random");
		quoteFromDb = await fetchRandomQuoteFromDatabase(c.env);
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
		await storeQuoteInDatabase(c.env, quote, author, htmlQuote);
	}
	const endStoreDb = performance.now()
	console.log(`fetch time: ${(endFetch-startFetch).toFixed(2)}ms, fetch db time: ${(endFetchDb-startFetchDb).toFixed(2)}ms, store db time: ${(endStoreDb-startStoreDb).toFixed(2)}ms`)
	c.header('Content-Type', 'application/json');
		c.header('Access-Control-Allow-Origin', '*');  // Allow all domains
		c.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');  // Allow these HTTP methods
		c.header('Access-Control-Allow-Headers', 'Content-Type');  // Allow Content-Type header
	return c.json({quote:quote, author:author, htmlQuote: htmlQuote});
  } catch (error) {
    console.error('Error fetching or storing quote:', error);
	return c.html('Internal Server Error', { status: 500 });
  }
});


// Function to check if the quote already exists in the D1 database
async function isQuoteDuplicate(env:Env, quote:ZenQuote) {
	const query = `
		SELECT COUNT(*) as count
		FROM quotes
		WHERE quote = ?
	`;
	const stmt = env.DB.prepare(query);
	const result = await stmt.bind(quote).first();
	return result != null;
}

// Modify the storeQuoteInDatabase function to check for duplicates
async function storeQuoteInDatabase(env:Env, quote:string, author:string, htmlQuote:string) {
	const query = `
		INSERT INTO quotes (quote, author, html_quote, lang, url)
		VALUES (?, ?, ?, 'en', 'https://zenquotes.io/api/random')
		ON CONFLICT(quote) DO NOTHING;
	`;
	const stmt = env.DB.prepare(query);
	await stmt.bind(quote, author, htmlQuote).run();
}

// Export our Hono app: Hono automatically exports a
// Workers 'fetch' handler for you
export default app;
