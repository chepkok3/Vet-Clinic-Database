/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id integer primary key NOT NULL,
    name varchar(100),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);

ALTER TABLE animals ADD COLUMN species text;

CREATE TABLE owners (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  full_name TEXT NOT NULL,
  age INTEGER NOT NULL
);

CREATE TABLE species (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name TEXT
);

/* Modify animals table*/
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT, ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INT, ADD CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES owners(id);

