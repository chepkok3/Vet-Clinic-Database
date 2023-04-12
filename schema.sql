/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id integer primary key NOT NULL,
    name text,
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

/*"join table" for visits*/
CREATE TABLE vets (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name TEXT,
  age INTEGER,
  date_of_graduation DATE
);

/*species and vets many-to-many relationship */
CREATE TABLE specializations (
  vet_id INTEGER REFERENCES vets(id),
  species_id INTEGER REFERENCES species(id),
  PRIMARY KEY (vet_id, species_id)
);
ALTER TABLE animals ADD CONSTRAINT animals_id_unique UNIQUE (id);

/*animals and vets many-to-many relationship */
CREATE TABLE visits (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    animals_id integer REFERENCES animals(id),
    vet_id integer REFERENCES vets(id),
    visit_date DATE
    
--database performance audit
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
ALTER TABLE owners ALTER COLUMN age DROP NOT NULL;

CREATE INDEX vet_id_idx ON visits (vet_id);
CREATE INDEX animal_id_idx ON visits (animals_id);

);
CREATE INDEX owners_email_asc ON owners (email ASC);
CREATE INDEX owners_email_asc ON owners (email DESC);
/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id integer primary key NOT NULL,
    name text,
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

/*"join table" for visits*/
CREATE TABLE vets (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name TEXT,
  age INTEGER,
  date_of_graduation DATE
);

/*species and vets many-to-many relationship */
CREATE TABLE specializations (
  vet_id INTEGER REFERENCES vets(id),
  species_id INTEGER REFERENCES species(id),
  PRIMARY KEY (vet_id, species_id)
);
ALTER TABLE animals ADD CONSTRAINT animals_id_unique UNIQUE (id);

/*animals and vets many-to-many relationship */
CREATE TABLE visits (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    animal_id integer REFERENCES animals(id),
    vet_id integer REFERENCES vets(id),
    visit_date DATE
);


CREATE INDEX owners_email_asc ON owners (email ASC);
CREATE INDEX owners_email_asc ON owners (email DESC);




