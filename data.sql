/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, true, 10.23),
('Gabumon', '2018-11-15', 2, true, 8),
('Pikachu', '2021-01-07', 1, false, 15.04),
('Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, false, -11),
('Plantmon', '2021-11-15', 2, true, -5.7),
('Squirtle', '1993-04-02', 3, false, -12.13),
('Angemon', '2005-06-12', 1, true, -45),
('Boarmon', '2005-06-07', 7, true, 20.4),
('Blossom', '1998-10-13', 3, true, 17),
('Ditto', '2022-05-14', 4, true, 22);

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokemon'),
('Digimon');

UPDATE animals 
SET weight_kg = weight_kg * -1
WHERE name IN ('Charmander', 'Plantmon', 'Squirtle', 'Angemon');

BEGIN
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals 
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals 
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals 
WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete_ditto;
UPDATE animals 
SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT delete_ditto;
UPDATE animals 
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

UPDATE animals
SET species_id = 1;

UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';

UPDATE animals
SET owners_id = 1 WHERE name='Agumon';

UPDATE animals
SET owners_id = 2 WHERE name='Gabumon';

UPDATE animals
SET owners_id = 2 WHERE name='Pikachu';

UPDATE animals
SET owners_id = 3 WHERE name='Devimon';

UPDATE animals
SET owners_id = 3 WHERE name='Plantmon';

UPDATE animals
SET owners_id = 4 WHERE name='Charmander';

UPDATE animals
SET owners_id = 4 WHERE name='Squirtle';

UPDATE animals
SET owners_id = 4 WHERE name='Blossom';

UPDATE animals
SET owners_id = 5 WHERE name='Angemon';

UPDATE animals
SET owners_id = 5 WHERE name='Boarmon';

INSERT INTO vets (
    name,
    age,
    date_of_graduation
    ) VALUES
    ('William Tatcher', 45, '2000-04-23'),
    ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1981-05-04'),
    ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (
    species_id,
    vets_id
    ) VALUES
    (1, 1),
    (1, 3),
    (2, 3),
    (2, 4);

INSERT INTO visits (
    animals_id,
    vets_id,
    date_of_visit
    ) VALUES
    ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Vet William Tatcher'), '2020-5-24'),
    ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), '2020-7-22'),
    ((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), '2021-2-2'),
    ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), '2020-1-5'),
    ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), '2020-3-8'),
    ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), '2020-5-14'),
    ((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), '2021-5-4'),
    ((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), '2021-2-24'),
    ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), '2019-12-21'),
    ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Vet William Tatcher'), '2020-8-10'),
    ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), '2021-4-7'),
    ((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), '2019-9-29'),
    ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), '2020-10-3'),
    ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), '2020-11-4'),
    ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), '2019-1-24'),
    ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), '2019-5-15'),
    ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), '2020-2-27'),
    ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), '2020-8-3'),
    ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), '2020-5-24'),
    ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Vet William Tatcher'), '2021-1-11');

