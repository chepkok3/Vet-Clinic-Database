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
SELECT full_name, A.name FROM animals A JOIN owners O ON A.owner_id = O.id WHERE full_name = 'Jennifer Orwell' AND species_id = 2;
SELECT full_name, A.name FROM animals A JOIN owners O ON A.owner_id = O.id WHERE full_name = 'Dean Winchester' AND escape_attempts < 1;
SELECT  full_name, COUNT (owner_id) AS total FROM animals A JOIN owners O ON A.owner_id = O.id GROUP BY O.full_name ORDER BY total DESC LIMIT 1;

/*join table queries*/
--Who was the last animal seen by William Tatcher?
SELECT animals.name, visits.visit_date FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'William Tatcher' ORDER BY visits.visit_date DESC LIMIT 1;
--How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCT animals.name) FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vet_id GROUP BY vets.name HAVING vets.name = 'Stephanie Mendez';
--List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name AS specialties FROM vets FULL JOIN specializations ON vets.id = specializations.vet_id FULL JOIN species ON species.id = specializations.species_id;
--List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name, visits.visit_date FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vet_id WHERE visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30' AND vets.name = 'Stephanie Mendez';
--What animal has the most visits to vets?
SELECT animals.name, COUNT(animals.id) FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vet_id GROUP BY animals.name ORDER BY COUNT(animals_id) DESC LIMIT 1;
--Who was Maisy Smith's first visit?
SELECT animals.name, visits.visit_date FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Maisy Smith' ORDER BY visits.visit_date ASC LIMIT 1;
--Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name AS animal_name, animals.date_of_birth, animals.escape_attempts, animals.neutered, animals.weight_kg, vets.name AS vet_name, vets.age, vets.date_of_graduation, visits.visit_date FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vet_id ORDER BY visits.visit_date DESC LIMIT 1;
--How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(visits.animals_id) FROM visits JOIN vets ON vets.id = visits.vet_id JOIN animals ON animals.id = visits.animals_id JOIN specializations ON specializations.vet_id = vets.id WHERE specializations.species_id <> animals.species_id;
--What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(visits.animals_id) as count FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vet_id JOIN species ON species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY count DESC LIMIT 1;

--database performance audit
explain analyze SELECT COUNT(*) FROM visits where animals_id = 4;
explain analyze SELECT * FROM visits where vet_id = 2;
=======
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';





