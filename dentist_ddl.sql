create table clinics (
    name VARCHAR(100) NOT NULL,
    opening TIME NOT NULL,
    closing TIME NOT NULL,
    street_name VARCHAR(255) NOT NULL DEFAULT "",
    unit_no VARCHAR(10) NOT NULL DEFAULT "",
    postal_code VARCHAR(10) NOT NULL DEFAULT "",
    floor_number VARCHAR(3) NOT NULL DEFAULT ""
) engine = innodb;

insert into clinics (name, opening, closing)
    VALUES ("Accent Dental", "07:00", "18:00")

 create table dentists (
    dentist_id int unsigned PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    license_number VARCHAR(10) NOT NULL
) engine = innodb;

create database dentists;

create table clinics (
    clinic_id TINNYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY
    name VARCHAR(100) NOT NULL,
    opening TIME NOT NULL,
    closing TIME NOT NULL,
    street_name VARCHAR (255) NOT NULL DEFAULT "",
    unit_no VARCHAR(10) NOT NULL DEFAULT "",
    postal_code VARCHAR(10) NOT NULL DEFAULT "",
    floor_number VARCHAR(3) NOT NULL DEFAULT ""
) engine = innodb;

insert into clinics (name, opening, closing)
    VALUES ("Accent Dental", "07:00", "18:00");

create table dentists (
    dentist_id int unsigned PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    license_number VARCHAR(10) NOT NULL
) engine = innodb;

-- previously we only inserted one dentist at a time, now we will insert many in one go
insert into dentists (name, license_number) VALUES
    ("Dr. Chua", "M1023"),
    ("Dr. Tan", "#"),
    ("Dr. Heng", "L12234Z"),