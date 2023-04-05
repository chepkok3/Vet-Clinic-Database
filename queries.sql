/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true and escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
/*update-delete queries*/
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
DELETE from animals;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg <0;
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, AVG(escape_attempts) as avg_escape_attempts
FROM animals
GROUP BY neutered
ORDER BY avg_escape_attempts DESC;
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;
SELECT species, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

/*Write queries (using JOIN) to answer the questions*/
SELECT name as animal_name, full_name FROM animals A JOIN owners O ON A.owner_id = O.id WHERE full_name = 'Melody Pond';
SELECT A.name as animal_name, S.name as specie_type FROM animals A JOIN species S ON A.species_id = S.id WHERE S.name = 'Pokemon';
SELECT full_name, name as animal_name FROM animals A RIGHT JOIN owners O ON A.owner_id = O.id ; 
SELECT species.name, COUNT(*) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT full_name, A.name FROM animals A JOIN owners O ON A.owner_id = O.id WHERE full_name = 'Jennifer Orwell' AND species_id = 1;
SELECT full_name, A.name FROM animals A JOIN owners O ON A.owner_id = O.id WHERE full_name = 'Dean Winchester' AND escape_attempts < 1;
SELECT  full_name, COUNT (owner_id) AS total FROM animals A JOIN owners O ON A.owner_id = O.id GROUP BY O.full_name ORDER BY total DESC LIMIT 1;