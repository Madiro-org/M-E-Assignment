-- Create tables
CREATE TABLE person (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    gender VARCHAR(1),
    birthdate DATE,
    birthdate_estimated BOOLEAN,
    dead BOOLEAN,
    death_date DATE,
    cause_of_death VARCHAR(255)
);

CREATE TABLE patient (
    patient_id INT PRIMARY KEY,
    creator INT,
    date_created DATETIME,
    voided BOOLEAN,
    voided_by INT,
    date_voided DATETIME,
    void_reason VARCHAR(255)
);

CREATE TABLE person_name (
    person_name_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT,
    given_name VARCHAR(50),
    middle_name VARCHAR(50),
    family_name VARCHAR(50),
    preferred BOOLEAN
);

CREATE TABLE person_address (
    person_address_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT,
    address1 VARCHAR(255),
    address2 VARCHAR(255),
    city_village VARCHAR(255),
    state_province VARCHAR(255),
    postal_code VARCHAR(50),
    country VARCHAR(50),
    latitude VARCHAR(50),
    longitude VARCHAR(50)
);

CREATE TABLE patient_identifier (
    patient_identifier_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    identifier VARCHAR(50),
    identifier_type INT,
    preferred BOOLEAN
);

CREATE TABLE encounter (
    encounter_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    encounter_datetime DATETIME,
    location_id INT,
    form_id INT,
    encounter_type INT
);

CREATE TABLE concept (
    concept_id INT AUTO_INCREMENT PRIMARY KEY,
    short_name VARCHAR(50),
    description VARCHAR(255)
);

CREATE TABLE obs (
    obs_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT,
    concept_id INT,
    encounter_id INT,
    obs_datetime DATETIME,
    value_text VARCHAR(255),
    value_numeric DECIMAL(10, 2),
    value_datetime DATE
);

-- Insert fake data
INSERT INTO person (gender, birthdate, birthdate_estimated, dead, death_date, cause_of_death)
VALUES
('M', '1980-01-01', FALSE, FALSE, NULL, NULL),
('F', '1990-05-15', FALSE, FALSE, NULL, NULL),
('M', '1975-07-20', FALSE, FALSE, NULL, NULL),
('F', '1985-08-25', FALSE, FALSE, NULL, NULL),
('M', '1995-10-10', FALSE, FALSE, NULL, NULL);

INSERT INTO patient (patient_id, creator, date_created, voided, voided_by, date_voided, void_reason)
VALUES
(1, 1, '2024-05-01 08:00:00', FALSE, NULL, NULL, NULL),
(2, 1, '2024-05-01 08:00:00', FALSE, NULL, NULL, NULL),
(3, 1, '2024-05-01 08:00:00', FALSE, NULL, NULL, NULL),
(4, 1, '2024-05-01 08:00:00', FALSE, NULL, NULL, NULL),
(5, 1, '2024-05-01 08:00:00', FALSE, NULL, NULL, NULL);

INSERT INTO person_name (person_id, given_name, middle_name, family_name, preferred)
VALUES
(1, 'John', 'A', 'Doe', TRUE),
(2, 'Jane', 'B', 'Smith', TRUE),
(3, 'Michael', 'C', 'Brown', TRUE),
(4, 'Emily', 'D', 'Davis', TRUE),
(5, 'David', 'E', 'Wilson', TRUE);

INSERT INTO person_address (person_id, address1, address2, city_village, state_province, postal_code, country, latitude, longitude)
VALUES
(1, '123 Main St', 'Apt 4', 'Somewhere', 'SomeState', '12345', 'CountryA', '34.0522 N', '118.2437 W'),
(2, '456 Elm St', NULL, 'Anywhere', 'AnotherState', '67890', 'CountryB', '40.7128 N', '74.0060 W'),
(3, '789 Oak St', 'Suite 5', 'Everywhere', 'StateC', '11223', 'CountryC', '37.7749 N', '122.4194 W'),
(4, '321 Maple St', NULL, 'Somewhere', 'StateD', '54321', 'CountryD', '34.0522 N', '118.2437 W'),
(5, '654 Pine St', 'Apt 2', 'Anywhere', 'StateE', '09876', 'CountryE', '40.7128 N', '74.0060 W');

INSERT INTO patient_identifier (patient_id, identifier, identifier_type, preferred)
VALUES
(1, 'ABC123', 1, TRUE),
(2, 'DEF456', 1, TRUE),
(3, 'GHI789', 1, TRUE),
(4, 'JKL012', 1, TRUE),
(5, 'MNO345', 1, TRUE);

INSERT INTO encounter (patient_id, encounter_datetime, location_id, form_id, encounter_type)
VALUES
(1, '2024-05-01 08:30:00', 1, 1, 1),
(2, '2024-05-01 09:00:00', 1, 1, 1),
(3, '2024-05-01 09:30:00', 1, 1, 1),
(4, '2024-05-01 10:00:00', 1, 1, 1),
(5, '2024-05-01 10:30:00', 1, 1, 1);

INSERT INTO concept (short_name, description)
VALUES
('Diagnosis', 'Diagnosis of patient illness'),
('Medication', 'Medication prescribed to the patient'),
('Lab Test', 'Lab test results for the patient');

INSERT INTO obs (person_id, concept_id, encounter_id, obs_datetime, value_text, value_numeric, value_datetime)
VALUES
(1, 1, 1, '2024-05-01 08:30:00', 'Hypertension', NULL, NULL),
(1, 2, 1, '2024-05-01 08:30:00', 'Lisinopril', NULL, NULL),
(1, 3, 1, '2024-05-01 08:30:00', NULL, 120.5, NULL),
(2, 1, 2, '2024-05-01 09:00:00', 'Diabetes', NULL, NULL),
(2, 2, 2, '2024-05-01 09:00:00', 'Metformin', NULL, NULL),
(2, 3, 2, '2024-05-01 09:00:00', NULL, 150.2, NULL),
(3, 1, 3, '2024-05-01 09:30:00', 'Asthma', NULL, NULL),
(3, 2, 3, '2024-05-01 09:30:00', 'Albuterol', NULL, NULL),
(3, 3, 3, '2024-05-01 09:30:00', NULL, 98.7, NULL),
(4, 1, 4, '2024-05-01 10:00:00', 'Anemia', NULL, NULL),
(4, 2, 4, '2024-05-01 10:00:00', 'Iron Supplements', NULL, NULL),
(4, 3, 4, '2024-05-01 10:00:00', NULL, 110.3, NULL),
(5, 1, 5, '2024-05-01 10:30:00', 'Hyperlipidemia', NULL, NULL),
(5, 2, 5, '2024-05-01 10:30:00', 'Atorvastatin', NULL, NULL),
(5, 3, 5, '2024-05-01 10:30:00', NULL, 200.1, NULL);
