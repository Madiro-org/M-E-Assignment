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

CREATE TABLE drug_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    drug_name VARCHAR(100),
    dose_units VARCHAR(50),
    dose_strength DECIMAL(10, 2),
    frequency VARCHAR(50),
    duration INT,
    duration_units VARCHAR(50),
    instructions VARCHAR(255)
);

CREATE TABLE test_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    test_name VARCHAR(100),
    urgency VARCHAR(50),
    instructions VARCHAR(255)
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
(1, 1, '2024-05-15 08:00:00', FALSE, NULL, NULL, NULL),
(2, 1, '2024-05-15 08:00:00', FALSE, NULL, NULL, NULL),
(3, 1, '2024-05-15 08:00:00', FALSE, NULL, NULL, NULL),
(4, 1, '2024-05-15 08:00:00', FALSE, NULL, NULL, NULL),
(5, 1, '2024-05-15 08:00:00', FALSE, NULL, NULL, NULL);

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
(1, '2024-05-15 08:30:00', 1, 1, 1),
(2, '2024-05-15 09:00:00', 1, 1, 1),
(3, '2024-05-15 09:30:00', 1, 1, 1),
(4, '2024-05-15 10:00:00', 1, 1, 1),
(5, '2024-05-15 10:30:00', 1, 1, 1);

INSERT INTO concept (short_name, description)
VALUES
('Diagnosis', 'Diagnosis of patient illness'),
('Medication', 'Medication prescribed to the patient'),
('Lab Test', 'Lab test results for the patient');

-- Insert observation data for diagnoses
INSERT INTO obs (person_id, concept_id, encounter_id, obs_datetime, value_text, value_numeric, value_datetime)
VALUES
(1, 1, 1, '2024-05-15 08:30:00', 'Hypertension', NULL, NULL),
(2, 1, 2, '2024-05-15 09:00:00', 'Diabetes', NULL, NULL),
(3, 1, 3, '2024-05-15 09:30:00', 'Asthma', NULL, NULL),
(4, 1, 4, '2024-05-15 10:00:00', 'Anemia', NULL, NULL),
(5, 1, 5, '2024-05-15 10:30:00', 'Hyperlipidemia', NULL, NULL);

-- Insert medication orders
INSERT INTO drug_order (patient_id, drug_name, dose_units, dose_strength, frequency, duration, duration_units, instructions)
VALUES
(1, 'Amoxicilline', 'mg', 500, 'TID', 7, 'days', 'Take with water'),
(2, 'Albendazole', 'mg', 400, 'Once', 1, 'dose', 'Take on empty stomach'),
(3, 'Artemeter', 'mg', 50, 'BID', 3, 'days', 'Take with food'),
(4, 'Paracetamol', 'mg', 500, 'QID', 5, 'days', 'Take as needed for pain'),
(5, 'Amoxicilline', 'mg', 500, 'TID', 7, 'days', 'Take with water');

-- Insert lab test orders
INSERT INTO test_order (patient_id, test_name, urgency, instructions)
VALUES
(1, 'Rapid test for malaria - GE', 'Standard', 'Perform test immediately on receipt'),
(2, 'Complete blood count - NFS', 'Urgent', 'Send results to consulting physician'),
(3, 'CRP - C-reactive protein', 'Standard', 'No special preparation required'),
(4, 'Rapid test for malaria - GE', 'Urgent', 'Repeat test if initial result is negative'),
(5, 'Complete blood count - NFS', 'Standard', 'Check for anemia indicators');
