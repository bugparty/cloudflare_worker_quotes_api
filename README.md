# 🌟 Quotes API — Powered by Cloudflare Workers

A fast and lightweight quote API built using [Cloudflare Workers](https://developers.cloudflare.com/workers/) and [Hono](https://hono.dev/), storing data via [D1](https://developers.cloudflare.com/d1/) and [Prisma](https://www.prisma.io/).

## 🔗 Live API Endpoint

You can fetch a random quote with the following endpoint:

```
GET https://quotes.0xff.workers.dev/quote/random
```

Returns:
```json
{
  "id": 1,
  "text": "The only limit to our realization of tomorrow is our doubts of today.",
  "author": "Franklin D. Roosevelt"
}
```

---

## 🚀 Getting Started

### 1. Prerequisites

- Node.js (>=18 recommended)
- Cloudflare Wrangler: `npm install -g wrangler`
- Prisma CLI: `npm install -g prisma`

### 2. Install dependencies

```bash
npm install
```

### 3. Development server

```bash
npm run dev
```

This will start a local Cloudflare Worker using `wrangler dev`.

### 4. Deploy to Cloudflare

```bash
npm run deploy
```

---

## ⚙️ Load Testing

To run performance tests using [Artillery](https://artillery.io/):

1. Install globally:
   ```bash
   npm install -g artillery
   ```
2. Use your `.yml` or command line to simulate traffic (you can customize it as needed).

---

## 📌 Roadmap / TODO

- [ ] Schedule quote-fetching from external APIs using Cloudflare Cron Triggers.
- [ ] Add pagination and search capabilities.
- [ ] Rate limiting or API key authentication (optional).

---

## 🧱 Built With

- [Cloudflare Workers](https://developers.cloudflare.com/workers/)
- [Hono](https://hono.dev/) - Lightweight Web Framework
- [Prisma](https://www.prisma.io/) - Database ORM
- [D1](https://developers.cloudflare.com/d1/) - Serverless SQL database for Workers

---

## 📂 Project Structure

```
├── index.ts           # Main Worker code
├── package.json       # Project configuration
├── README.md          # You're reading it!
```

---

## 🧪 Type Checking

Generate Cloudflare types (optional):

```bash
npm run cf-typegen
```

---

## 📝 License

MIT — feel free to use, contribute, or fork this project!

---
