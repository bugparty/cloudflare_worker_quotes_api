npx wrangler d1 execute quotes_db  --remote --command="SELECT COUNT(*) as count FROM quotes"
npx wrangler d1 execute quotes_db  --remote --command="SELECT COUNT(DISTINCT author) as count FROM quotes ORDER BY author;"

