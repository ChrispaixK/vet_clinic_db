/* Populate database with sample data. */

INSERT INTO animals VALUES(1,'Agumon','2020-02-03',0,'1',10.23);
INSERT INTO animals VALUES(2,'Gabumon','2018-11-15',2,'1',8);
INSERT INTO animals VALUES(3,'Pikachu','2021-01-07',1,'0',8);
INSERT INTO animals VALUES(4,'Agumon','2017-05-12',5,'1',11);
INSERT INTO animals VALUES(5,'Charmander','2020-02-08',0,'0',-11);
INSERT INTO animals VALUES(6,'Plantmon','2021-11-15',2,'1',-5.7);
INSERT INTO animals VALUES(7,'Squirtle','1993-04-02',3,'0',-12.13);
INSERT INTO animals VALUES(8,'Angemon','2005-06-12',1,'1',-45);
INSERT INTO animals VALUES(9,'Boarmon','2005-06-07',7,'1',20.4);
INSERT INTO animals VALUES(10,'Blossom','1998-10-13',3,'1',17);
INSERT INTO animals VALUES(11,'Dito','2022-05-14',4,'1',22);

INSERT INTO owners (full_name, age) VALUES ('Sam Smith',34), ('Jennifer Orwell',19), ('Bob',45), ('Melody Pond',77), ('Dean Winchester', 14), ('Jodie Whittaker',38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET species_id = (SELECT species.id FROM species WHERE species.name = 'Digimon') WHERE animals.name::text LIKE '%mon';
UPDATE animals SET species_id = (SELECT species.id FROM species WHERE species.name = 'Pokemon') WHERE animals.name::text NOT LIKE '%mon';

UPDATE animals SET owner_id = (SELECT owners.id FROM owners WHERE owners.full_name = 'Sam Smith') WHERE animals.name = 'Agumon';
UPDATE animals SET owner_id = (SELECT owners.id FROM owners WHERE owners.full_name = 'Jennifer Orwell') WHERE animals.name = 'Gabumon' OR animals.name = 'Pikachu';
UPDATE animals SET owner_id = (SELECT owners.id FROM owners WHERE owners.full_name = 'Bob') WHERE animals.name = 'Devimon' OR animals.name = 'Plantmon';
UPDATE animals SET owner_id = (SELECT owners.id FROM owners WHERE owners.full_name = 'Melody Pond') WHERE animals.name = 'Charmander' OR animals.name = 'Squirtle' OR animals.name = 'Blossom';
UPDATE animals SET owner_id = (SELECT owners.id FROM owners WHERE owners.full_name = 'Dean Winchester') WHERE animals.name = 'Angemon' OR animals.name = 'Boarmon';