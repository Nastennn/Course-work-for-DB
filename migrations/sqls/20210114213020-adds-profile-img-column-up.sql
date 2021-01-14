ALTER TABLE characters
    ADD COLUMN image text;

UPDATE characters
SET image = 'https://static.wikia.nocookie.net/harrypotter/images/a/a3/Severus_Snape.jpg/revision/latest?cb=20150307193047'
WHERE username = 'snegg';

UPDATE characters
SET image = 'https://static.wikia.nocookie.net/harrypotter/images/6/65/ProfessorMcGonagall-HBP.jpg/revision/latest?cb=20100612114856'
WHERE username = 'minerva';

UPDATE characters
SET image = 'https://static.wikia.nocookie.net/harrypotter/images/f/fe/Rubeus_Hagrid.png/revision/latest/scale-to-width-down/350?cb=20161123044204'
WHERE username = 'hagrid'
