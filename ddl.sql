-- create a new database; we must create the database before we can use it
create database swimming_coach;

-- switch our active database to what we have just created

use swimming_coach;

-- to see all tables in the current database:

-- create table command is to create a new table
-- we need 'engine = innodb' for foreign keys to work (enforce referential integrity)
create table parents (
    -- UNSIGNED: unsigned integer
    -- AUTO_INCREMENT: it'll be the final ID +1
    -- PRIMARY KEY: this will be the primary key for the entire table
    parent_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    contact_number VARCHAR(8) 
) engine = innodb;

-- see the columns in the table
DESCRIBE parents;

-- create the students table first,
-- then set the foreign key

CREATE TABLE students (
    student_id MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    swimming_level TINYINT,
    date_of_birth DATETIME,
    -- only creating the parent_id column at this point,
    -- we still have to set the foreign key.
    parent_id INT UNSIGNED NOT NULL
) engine = innodb;

-- table has been created, so now we will set the foreign key such that the parent_id column 
-- in the student table must refer to a valid row in the parents table

-- ALTER TABLE <name of table> ADD CONSTRAINT <name of constraint>
-- fk for the students and parents
ALTER TABLE students ADD CONSTRAINT fk_students_parents
    FOREIGN KEY (parent_id) REFERENCES parents (parent_id);

-- insert some parents
-- to insert new roles into a table, we use the 'INSERT INTO <tableName>' command

-- insert a new row into parents, provide values for the two columns name and contact number
INSERT INTO parents (name, contact_number) VALUES ("Tan Ah Kow", "11223344");

-- to see all the rows in a table, 
SELECT * FROM parents;

-- to see tables
show tables;

-- insert a new student
-- no need for a student id bc it's auto-increment
-- date format is YYYY-DD-MM
INSERT INTO students (name, swimming_level, date_of_birth, parent_id)
    VALUES ("Tan Ah Boy", 0, "2022-01-03", 1);

-- the following code will not work because there is no parent with the parent_id of 99
INSERT INTO students(name, swimming_level, date_of_birth, parent_id)
    VALUES ("Tan Ah Girl", 0, "2022-01-03", 99);

-- however, this will,  because there is a parent with the parent_id of 1
INSERT INTO students(name, swimming_level, date_of_birth, parent_id)
    VALUES ("Tan Ah Girl", 0, "2022-01-03", 1);

-- every reference must point to a valid row.
-- first delete the children that belong to the parent, then delete the parent

-- change an existing column definition
-- e.g. change the contact number in the parents' table to varchar(11)

ALTER TABLE parents MODIFY COLUMN contact_number VARCHAR(11)