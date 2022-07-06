/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    PRIMARY KEY(id)
);

ALTER TABLE animals
ADD COLUMN species VARCHAR;

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR,
    age INT,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR,
    PRIMARY KEY(id)
);

ALTER TABLE animals 
DROP COLUMN species;

ALTER TABLE animals 
ADD COLUMN species_id INT;

ALTER TABLE animals 
ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals 
ADD COLUMN owners_id INT;

ALTER TABLE animals 
ADD CONSTRAINT fk_owners_id FOREIGN KEY (owners_id) REFERENCES owners (id);
