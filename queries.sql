/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals
WHERE name::text LIKE '%mon';
SELECT name FROM animals
WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-12-31';
SELECT name FROM animals
WHERE neutered = '1' AND escape_attempts < 3;
SELECT date_of_birth FROM animals
WHERE name = 'Agumon' OR name= 'Pikachu';
SELECT name , escape_attempts FROM animals
WHERE weight_kg > 10.5 ;
SELECT * FROM animals 
WHERE neutered = '1';
SELECT * FROM animals 
WHERE name != 'Gabumon';
SELECT * FROM animals
WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
SAVEPOINT BEFORE;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK BEFORE;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species ='digimon' WHERE name::text LIKE '%mon';
UPDATE animals SET species ='pokemon' WHERE name::text NOT LIKE '%mon';
COMMIT;
SELECT * FROM animals;

BEGIN;
SAVEPOINT BEFOREDEL;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK TO BEFOREDEL;
SELECT * FROM animals;
COMMIT;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT changeWeight;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK changeWeight;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT (*) FROM animals;
SELECT COUNT (name) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT COUNT(escape_attempts), neutered FROM animals GROUP BY neutered;
SELECT MIN(weight_kg), MAX (weight_kg), species FROM animals GROUP BY species;
SELECT AVG(escape_attempts), species FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2022-12-31' GROUP BY species;

SELECT owners.full_name, animals.name animals FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT animals.name animals FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT owners.full_name owners, animals.name animals FROM owners LEFT JOIN animals ON animals.species_id = owners.id;
SELECT species.name species, COUNT(animals.name) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT animals.name animals FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON species.id = animals.species_id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';
SELECT animals.name animals FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
SELECT owners.full_name owners, count(animals.name) FROM owners JOIN animals ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY COUNT(animals.name) DESC LIMIT 1;