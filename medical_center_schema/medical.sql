DROP DATABASE IF EXISTS medical;

CREATE DATABASE medical;

\c medical



CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    specialty TEXT NOT NULL,
    salary INTEGER NOT NULL
);

CREATE TABLE symptoms (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    insurance TEXT
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    treatment TEXT
);

CREATE TABLE patients_symptoms(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients (id) ON DELETE CASCADE,
    symptom_id INTEGER REFERENCES symptoms (id) ON DELETE CASCADE

);

CREATE TABLE diseases_symptoms(
    id SERIAL PRIMARY KEY,
    disease_id INTEGER REFERENCES diseases (id) ON DELETE CASCADE,
    symptom_id INTEGER REFERENCES symptoms (id) ON DELETE CASCADE
);

-- CREATE TABLE diagnosis (
--     id SERIAL PRIMARY KEY,
--     --patient_symptom_id INTEGER REFERENCES patients (symptom_id),
--     disease_name TEXT REFERENCES diseases (name),
--     disease_symptom_id INTEGER REFERENCES diseases (symptom_id)
-- );

CREATE TABLE appointments (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients (id),
    doctor_id INTEGER REFERENCES doctors (id),
    date DATE NOT NULL
);

