/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
  id INT PRIMARY KEY NOT NULL,
  name CHAR (50),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL,
  species CHAR (250)
);

CREATE TABLE owners (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  full_name varchar(255),
  age INT
);

CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name varchar(250)
);

ALTER TABLE
  animals DROP id;

ALTER TABLE
  animals
ADD
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY;

ALTER TABLE
  animals DROP species;

ALTER TABLE
  animals
ADD
  species_id INT REFERENCES species(id);

ALTER TABLE
  animals
ADD
  owner_id INT REFERENCES owners(id);

CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name varchar(250),
  age INT,
  date_of_graduation date
);

CREATE TABLE specializations(
  vet_id INT NOT NULL,
  species_id INT NOT NULL,
  PRIMARY KEY(vet_id, species_id)
);

ALTER TABLE
  specializations
ADD
  FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE
  specializations
ADD
  FOREIGN KEY(vet_id) REFERENCES vets(id);

CREATE TABLE visits(
  vet_id INT NOT NULL,
  animal_id INT NOT NULL,
  date_of_visit date NOT NULL,
  PRIMARY KEY(vet_id, animal_id, date_of_visit)
);

ALTER TABLE
  visits
ADD
  FOREIGN KEY(animal_id) REFERENCES animals(id);

ALTER TABLE
  visits
ADD
  FOREIGN KEY(vet_id) REFERENCES vets(id);