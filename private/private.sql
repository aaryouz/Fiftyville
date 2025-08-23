-- Create a new table to store the selected sentences
CREATE TABLE IF NOT EXISTS "selected_sentences" (
    "id" INTEGER,
    "sentence" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Insert the sentences with the specified IDs into the new table
INSERT INTO selected_sentences (id, sentence)
SELECT id, sentence
FROM sentences
WHERE id IN (14, 114, 618, 630, 932, 2230, 2346, 3041);

-- Add columns for the second and third numbers from the triplets
ALTER TABLE selected_sentences ADD COLUMN num2 INTEGER;
ALTER TABLE selected_sentences ADD COLUMN num3 INTEGER;

-- Update the table with the triplet data
UPDATE selected_sentences SET num2 = 98, num3 = 4 WHERE id = 14;
UPDATE selected_sentences SET num2 = 3, num3 = 5 WHERE id = 114;
UPDATE selected_sentences SET num2 = 72, num3 = 9 WHERE id = 618;
UPDATE selected_sentences SET num2 = 7, num3 = 3 WHERE id = 630;
UPDATE selected_sentences SET num2 = 12, num3 = 5 WHERE id = 932;
UPDATE selected_sentences SET num2 = 50, num3 = 7 WHERE id = 2230;
UPDATE selected_sentences SET num2 = 44, num3 = 10 WHERE id = 2346;
UPDATE selected_sentences SET num2 = 14, num3 = 5 WHERE id = 3041;

-- Create the required view named "message"
CREATE VIEW message AS
SELECT substr(sentence, num2, num3) AS phrase
FROM selected_sentences
ORDER BY id;
