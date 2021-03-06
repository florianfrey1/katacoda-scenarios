CREATE DATABASE demo;

\c demo

CREATE TABLE IF NOT EXISTS Kunde (
    id SERIAL PRIMARY KEY,
    vorname VARCHAR NOT NULL,
    nachname VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS Bestellung (
    id SERIAL PRIMARY KEY,
    kunde_id SERIAL NOT NULL REFERENCES Kunde(id),
    datum TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS Artikel (
    id SERIAL PRIMARY KEY,
    bezeichnung VARCHAR NOT NULL,
    preis NUMERIC(5, 2) NOT NULL CHECK(preis >= 0)
);

CREATE TABLE IF NOT EXISTS Position (
    bestellung_id SERIAL REFERENCES Bestellung(id),
    artikel_id SERIAL REFERENCES Artikel(id),
    menge INTEGER CHECK(menge > 0) DEFAULT 1,
    PRIMARY KEY (bestellung_id, artikel_id)
);

INSERT INTO Kunde (vorname, nachname) VALUES
    ('Paul', 'Müller'),
    ('Paula', 'Schmidt'),
    ('Peter', 'Huber');

INSERT INTO Bestellung (kunde_id, datum) VALUES
    (1, '2020-12-10 08:33:12'),
    (2, '2021-04-17 19:28:46'),
    (1, '2021-10-05 14:06:37'),
    (2, '2021-11-15 11:13:05');

INSERT INTO Artikel (bezeichnung, preis) VALUES
    ('Schaumbad', 3.95),
    ('Seife', 1.35),
    ('Quitscheente', 5.49),
    ('Quatsch', 0.01);

INSERT INTO Position (bestellung_id, artikel_id, menge) VALUES
    (1, 1, 1),
    (1, 3, 1),
    (2, 2, 4),
    (3, 1, 3),
    (4, 3, 1),
    (4, 1, 2);

CREATE TABLE IF NOT EXISTS Verkauf (
    id SERIAL PRIMARY KEY,
    kunde_id SERIAL REFERENCES Kunde(id),
    artikel_id SERIAL REFERENCES Artikel(id),
    datum TIMESTAMP NOT NULL,
    umsatz NUMERIC(5, 2) NOT NULL CHECK(umsatz >= 0),
    menge INTEGER CHECK(menge > 0) DEFAULT 1
);