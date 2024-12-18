DROP TABLE IF EXISTS quotes;
CREATE TABLE  IF NOT EXISTS  quotes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  quote TEXT NOT NULL,
  author TEXT NOT NULL,
  html_quote TEXT NOT NULL,
  lang TEXT NOT NULL DEFAULT 'en',
  url TEXT NOT NULL
);
INSERT INTO quotes (quote, author, html_quote, lang, url) VALUES
("He who violates another's honor loses his own.", 'Publilius Syrus', "<blockquote>&ldquo;He who violates another's honor loses his own.&rdquo; &mdash; <footer>Publilius Syrus</footer></blockquote>", 'en', 'https://zenquotes.io/api/random'),
('Most people fail in life because they major in minor things.', 'Tony Robbins', "\u003Cblockquote\u003E&ldquo;Most people fail in life because they major in minor things.&rdquo; &mdash; \u003Cfooter\u003ETony Robbins\u003C/footer\u003E\u003C/blockquote\u003E", 'en', 'https://zenquotes.io/api/random');



