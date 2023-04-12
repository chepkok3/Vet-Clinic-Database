/* Populate database with sample data. */
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (1,'Agumon','2020-02-03',0,true,10.23);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (2,'Gabumon','2018-11-15',2,true,8);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (3,'Pikachu','2021-01-07',1,false,15.04);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (4,'Devimon','2017-05-12',5,true,11);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (5,'Charmander','2020-02-08',0,false,-11);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (6,'Plantmon','2021-11-15',2,true,-5.7);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (7,'Squirtle','1993-04-02',3,false,-12.13);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (8,'Angemon','2005-06-12',1,true,-45);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (9,'Boarmon','2005-06-07',7,true,20.4);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (10,'Blossom','1998-10-13',3,true,17);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (11,'Ditto','2022-05-14',4,true,22);

INSERT INTO owners (full_name,age) VALUES ('Sam Smith',34);
INSERT INTO owners (full_name,age) VALUES ('Jennifer Orwell',19);
INSERT INTO owners (full_name,age) VALUES ('Bob',45);
INSERT INTO owners (full_name,age) VALUES ('Melody Pond',77);
INSERT INTO owners (full_name,age) VALUES ('Dean Winchester',14);
INSERT INTO owners (full_name,age) VALUES ('Jody Whittaker',38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

/*Modify inserted animals so it includes the species_id value*/
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

/*Modify inserted animals to include owner information (owner_id)*/
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

/*join data for visits*/
INSERT INTO vets (name,age,date_of_graduation) VALUES ('William Tatcher',45,'2000-04-23');
INSERT INTO vets (name,age,date_of_graduation) VALUES ('Maisy Smith',26,'2019-01-17');
INSERT INTO vets (name,age,date_of_graduation) VALUES ('Stephanie Mendez',64,'1981-05-04');
INSERT INTO vets (name,age,date_of_graduation) VALUES ('Jack Harkness',38,'2007-06-08');

-- Insert data into the specializations table
INSERT INTO specializations (vet_id, species_id) VALUES ((select id FROM vets WHERE name = 'William Tatcher' LIMIT 1), (SELECT id FROM species WHERE name = 'Pokemon' LIMIT 1));
INSERT INTO specializations (vet_id, species_id) VALUES ((select id FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1), (SELECT id FROM species WHERE name = 'Pokemon' LIMIT 1)), ((SELECT id FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1), (SELECT id FROM species WHERE name = 'Digimon' LIMIT 1));
INSERT INTO specializations (vet_id, species_id) VALUES ((select id FROM vets WHERE name = 'Jack Harkness' LIMIT 1), (SELECT id FROM species WHERE name = 'Digimon' LIMIT 1));

-- insert data for visits
INSERT INTO visits (animals_id, vet_id,  visit_date)
VALUES 
((SELECT id FROM animals WHERE name = 'Agumon' LIMIT 1), (SELECT id FROM vets WHERE name = 'William Tatcher' LIMIT 1), '2020-05-24'),
((SELECT id FROM animals WHERE name = 'Agumon' LIMIT 1), (SELECT id FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1), '2020-07-22'),
((SELECT id FROM animals WHERE name = 'Gabumon' LIMIT 1), (SELECT id FROM vets WHERE name = 'Jack Harkness' LIMIT 1), '2021-02-02'),
((SELECT id FROM animals WHERE name = 'Pikachu' LIMIT 1), (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1), '2020-01-05'),
((SELECT id FROM animals WHERE name = 'Pikachu' LIMIT 1), (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1), '2020-03-08'),
((SELECT id FROM animals WHERE name = 'Pikachu' LIMIT 1), (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1), '2020-05-14'),
((SELECT id FROM animals WHERE name = 'Devimon' LIMIT 1), (SELECT id FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1), '2021-05-04'),
((SELECT id FROM animals WHERE name = 'Charmander' LIMIT 1), (SELECT id FROM vets WHERE name = 'Jack Harkness' LIMIT 1), '2021-02-24'),
((SELECT id FROM animals WHERE name = 'Plantmon' LIMIT 1), (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1), '2019-12-21'),
((SELECT id FROM animals WHERE name = 'Plantmon' LIMIT 1), (SELECT id FROM vets WHERE name = 'William Tatcher' LIMIT 1), '2020-08-10'),
((SELECT id FROM animals WHERE name = 'Plantmon' LIMIT 1), (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1), '2021-04-07'),
((SELECT id FROM animals WHERE name = 'Squirtle' LIMIT 1), (SELECT id FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1), '2021-09-29'),
((SELECT id FROM animals WHERE name = 'Angemon' LIMIT 1), (SELECT id FROM vets WHERE name = 'Jack Harkness' LIMIT 1), '2020-10-03'),
((SELECT id FROM animals WHERE name = 'Angemon' LIMIT 1), (SELECT id FROM vets WHERE name = 'Jack Harkness' LIMIT 1), '2020-11-04'),
((SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1), (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1), '2019-01-24'),
((SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1), (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1), '2019-05-15'),
((SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1), (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1), '2020-02-27'),
((SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1), (SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1), '2020-08-03'),
((SELECT id FROM animals WHERE name = 'Blossom' LIMIT 1), (SELECT id FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1), '2020-05-24'),
((SELECT id FROM animals WHERE name = 'Blossom' LIMIT 1), (SELECT id FROM vets WHERE name = 'William Tatcher' LIMIT 1), '2021-01-11');

SELECT * FROM animals;
--database performance audit
INSERT INTO visits (animals_id, vet_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';





