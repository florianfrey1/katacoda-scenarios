CREATE DATABASE relational_database;
CREATE DATABASE star_database;

\c star_database

CREATE TABLE IF NOT EXISTS Kunde (
    id SERIAL PRIMARY KEY,
    vorname VARCHAR NOT NULL,
    nachname VARCHAR NOT NULL
);