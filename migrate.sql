-- Create new column with unique constraint
ALTER TABLE quotes ADD COLUMN quote_new TEXT;


-- Copy data from old quote to new quote_new column
UPDATE quotes SET quote_new = quote;

-- Drop the old column
ALTER TABLE quotes DROP COLUMN quote;

-- Rename the new column back to quote
ALTER TABLE quotes RENAME COLUMN quote_new TO quote;

CREATE UNIQUE INDEX quotes_quote_unique ON quotes(quote);
