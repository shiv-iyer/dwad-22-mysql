-- step 0: USE SQL
mysql -u root;

-- step 1: create the database
create database pet_hospital;

-- step 2: use the database
use pet_hospital;

-- step 3: create the owners table
CREATE TABLE owners (
    owner_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    contact_number VARCHAR(8) NOT NULL
) engine = innodb;

-- see the columns in the owners table
DESCRIBE owners;

-- step 4: create the other strong entities first / entities in order to be referenced
-- so, appointments first
-- for every primary key always auto increment
-- skeleton: add the reference (foreign key) at the very end of the table

-- PUTTING PET ID IN APPOINTMENT MEANS WE DON'T HAVE TO REUSE IT IN DIAGNOSIS

CREATE TABLE appointments (
    appointment_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    diagnosis VARCHAR(100) NOT NULL,
    vet_id INT UNSIGNED NOT NULL,
    owner_id INT UNSIGNED NOT NULL,
    pet_id INT UNSIGNED NOT NULL
) engine = innodb;

-- create pets table
CREATE TABLE pets (
    pet_id MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    breed VARCHAR(30) NOT NULL,
    date_of_birth date NOT NULL,
    owner_id INT UNSIGNED NOT NULL
) engine = innodb;

-- medical history table, which is weak to pets
-- when seems to be a keyword
-- use text data type for storing text instead of varchar
CREATE TABLE medical_history (
    medicalHistory_id MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    whenDiagnosed DATETIME NOT NULL,
    comment TEXT NOT NULL
) engine = innodb;

-- prescription table, two foreign keys (pet id and appointment id)
CREATE TABLE prescription (
    prescription_id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    dosage VARCHAR(100) NOT NULL,
    pet_id MEDIUMINT UNSIGNED NOT NULL,
    appointment_id INT UNSIGNED NOT NULL
) engine = innodb;

-- treatment table
-- reference to prescription id

CREATE TABLE treatment (
    treatment_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    medication_number VARCHAR(100) NOT NULL,
    prescription_id SMALLINT UNSIGNED NOT NULL
) engine = innodb;

-- vets now, vet is a strong entity
CREATE TABLE vets (
    vet_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    appointment_id INT UNSIGNED NOT NULL
) engine = innodb;

-- skillsets table
CREATE TABLE skillsets (
    sillset_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    certified boolean NOT NULL,
    certified_since date NOT NULL
) engine = innodb;

-- now the pivot table between vets and skillsets

-- rolling with the typo sillset
CREATE TABLE skills_vet (
    skills_vet_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    vet_id INT UNSIGNED NOT NULL,
    sillset_id INT UNSIGNED NOT NULL
) engine = innodb;

-- FINAL TABLE, diagnosis
CREATE TABLE diagnosis (
    diagnosis_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    description TEXT NOT NULL,
    appointment_id INT UNSIGNED NOT NULL
) engine = innodb;

-- to delete a table, DROP TABLE <tableName>
DELETE TABLE appointments; -- then we created it again

-- now for insertion of data, syntax
-- INSERT INTO tableName (parameters to insert) VALUES (values to insert)

INSERT INTO owners (first_name, last_name, address, contact_number)
    VALUES ("Alan", "Sia", "Bukit Panjang", "88342345");

-- selecting a row from a table: SELECT * from tableName, * selects everything

-- create a pet for alan
-- date format in SQL Is YYYY-MM-DD
-- owner id 1 because alan exists in the owners table, with id 1
INSERT INTO pets (name, breed, date_of_birth, owner_id)
    VALUES ("Pikachu", "British Shorthair Cat", "2022-03-23", 1);

-- last step, try to modify the definition of a column, changing name from varchar(255) to varchar(100)
ALTER TABLE pets MODIFY COLUMN name VARCHAR(100);

-- how do we modify the value? that is later on
-- the actual value is later