PRAGMA foreign_keys=on; -- Turns foreign key support in SQLite3 on
-- Your code here
DROP TABLE IF EXISTS cat_owners;
DROP TABLE IF EXISTS toys;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS cats;

CREATE TABLE owners (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name TEXT,
  last_name TEXT
);

CREATE TABLE cats (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  birth_year INTEGER
);

CREATE TABLE cat_owners (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  cat_id INTEGER,
  owner_id INTEGER,
  FOREIGN KEY (cat_id) REFERENCES cats(id) ON DELETE CASCADE,
  FOREIGN KEY (owner_id) REFERENCES owners(id) ON DELETE CASCADE
);

CREATE TABLE toys (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  cat_id INTEGER,
  FOREIGN KEY (cat_id) REFERENCES cats(id) ON DELETE CASCADE
);

INSERT INTO owners
  (first_name, last_name)
VALUES
  ('Nathan', 'Shanahan'),
  ('Joycelyn', 'Cummerata'),
  ('Weston', 'Jones'),
  ('Melynda', 'Abshire'),
  ('George', 'Beatty'),
  ('Jonathan', 'Arbuckle'),
  ('Hermione', 'Granger');

INSERT INTO cats
  (name, birth_year)
VALUES
  ('Smudge', 2014),
  ('Molly', 2015),
  ('Lucky', 2016),
  ('Bella', 2020),
  ('Tiger', 2012),
  ('Oscar', 2010),
  ('Garfield', 2009),
  ('Crookshanks', 2017);

INSERT INTO cat_owners
  (cat_id, owner_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 3),
  (4, 4),
  (5, 4),
  (5, 5),
  (7, 6),
  (8, 7);

INSERT INTO toys
  (cat_id, name)
VALUES
  (1, 'Catnip Mouse'),
  (2, 'Feather Wand'),
  (2, 'Scratcher'),
  (2, 'Laser Pointer'),
  (3, 'Chew Toy'),
  (4, 'Tunnel'),
  (4, 'Flopping Fish'),
  (7, 'Cheetos'),
  (8, 'Crinkle Ball'),
  (8, 'Yarn');
-- SELECT cats.name, owners.first_name FROM cat_owners
-- JOIN cats ON (cat_owners.cat_id = cats.id)
-- JOIN owners ON (cat_owners.owner_id = owners.id)
-- WHERE owners.first_name = 'Hermione';

-- SELECT owners.first_name, toys.name FROM cats
-- JOIN cat_owners ON (cat_owners.cat_id = cats.id)
-- JOIN owners ON (cat_owners.owner_id = owners.id)
-- JOIN toys ON (toys.cat_id = cats.id)
-- WHERE owners.first_name = 'Hermione';

-- SELECT * FROM owners;
-- SELECT * FROM cat_owners;
-- DELETE FROM owners WHERE first_name='Hermione';
-- SELECT * FROM owners;
-- SELECT * FROM cat_owners;

-- Find the first owner that has a last name containing the lowercase letter "r"
-- Your code here
-- SELECT * FROM owners WHERE last_name LIKE ('%r%') LIMIT 1;
-- Find the name and birth year of all the cats ordered by descending birth year
-- Your code here

-- SELECT name, birth_year FROM cats ORDER BY birth_year DESC;

-- Find the name of the cats who have an owner whose first name begins with an "H"
-- Your code here
-- SELECT cats.name, owners.first_name FROM cat_owners
-- JOIN owners ON (owners.id = cat_owners.owner_id)
-- JOIN cats ON (cats.id = cat_owners.cat_id)
-- WHERE owners.first_name LIKE ('H%');

-- Find the first and last names of the owner whose cats are born after the year 2015
-- Your code here
-- SELECT owners.first_name FROM cat_owners
-- JOIN owners ON (owners.id = cat_owners.owner_id)
-- JOIN cats ON (cats.id = cat_owners.cat_id)
-- WHERE cats.birth_year > 2015;

-- Find names of the cats whose owners are both George Beatty and Melynda Abshire, or just George Beatty, or just Melynda Abshire
-- Your code here

SELECT DISTINCT cats.name FROM cat_owners
JOIN cats ON (cats.id = cat_owners.cat_id)
JOIN owners ON (owners.id = cat_owners.owner_id)
WHERE (owners.first_name = "George" AND owners.last_name = "Beatty")
OR (owners.first_name = "Melynda" AND owners.last_name = "Abshire");
