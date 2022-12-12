-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    orbital_period_in_years FLOAT NOT NULL,
    orbits_around TEXT NOT NULL,
);

CREATE TABLE galaxys
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE moons
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE planets_moons
(
    id SERIAL PRIMARY KEY,
    planet_id INTEGER REFERENCES planets (id),
    moon_id INTEGER REFERENCES moons (id)
);

CREATE TABLE galaxys_planets
(
    id SERIAL PRIMARY KEY,
    galaxy_id INTEGER REFERENCES galaxys (id),
    planet_id INTEGER REFERENCES planets (id)
);

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');


INSERT INTO planets (name, orbital_period_in_years, orbits_around)
VALUES
('Earth', 1.00, 'The Sun'),
('Mars', 1.88, 'The Sun'),
('Venus', 0.62, 'The Sun'),
('Neptune', 164.8, 'The Sun'),
('Proxima Centauri b', 0.03, 'Proxima Centauri'),
('Gliese 876 b', 0.23, 'Gliese 876');


INSERT INTO galaxys (name)
VALUES
('The Milky Way');


INSERT INTO moons (name)
VALUES
('The Moon'),
('Phobos'),
('Deimos'),
('Naiad'),
('Thalassa'),
('Despina'),
('Galatea'),
('Larisa'),
('S/2004 N 1'),
('Proteus'),
('Triton'),
('Nereid'),
('Halimede'),
('Sao'),
('Laomedeia'),
('Psamathe'),
('Neso');


INSERT INTO planets_moons (planet_id,moon_id)
VALUES
(1,1),
(2,2),
(2,3),
(3,NULL),
(4,4),
(4,5),
(4,6),
(4,7),
(4,8),
(4,9),
(4,10),
(4,11),
(4,12),
(4,13),
(4,14),
(4,15),
(4,16),
(4,17),
(5,NULL),
(6,NULL);

INSERT INTO galaxys_planets (galaxy_id,planet_id)
VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6);
