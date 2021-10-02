CREATE TABLE IF NOT EXISTS Kunde (
    id SERIAL PRIMARY KEY,
    vorname VARCHAR NOT NULL,
    nachname VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS Artikel (
    id SERIAL PRIMARY KEY,
    bezeichnung VARCHAR NOT NULL,
    preis NUMERIC(5, 2) NOT NULL CHECK(preis >= 0)
);

CREATE TABLE IF NOT EXISTS Verkauf (
    id SERIAL PRIMARY KEY,
    kunde_id SERIAL REFERENCES Kunde(id),
    artikel_id SERIAL REFERENCES Artikel(id),
    datum TIMESTAMP NOT NULL,
    umsatz NUMERIC(5, 2) NOT NULL CHECK(umsatz >= 0),
    menge INTEGER CHECK(menge > 0) DEFAULT 1
);

INSERT INTO Kunde (vorname, nachname) VALUES
    ('Paul', 'Müller'),
    ('Paula', 'Schmidt');

INSERT INTO Artikel (bezeichnung, preis) VALUES
    ('Schaumbad', 3.95),
    ('Seife', 1.35),
    ('Quitscheente', 5.49),
    ('Quatsch', 0.01);

INSERT INTO Verkauf (kunde_id, artikel_id, datum, umsatz, menge) VALUES
    (1, 1, '2020-12-10 08:33:12', 7.90, 2),
    (1, 3, '2020-12-10 08:33:12', 5.49, 1),
    (2, 2, '2021-04-17 19:28:46', 5.40, 4),
    (1, 1, '2020-10-05 14:06:37', 7.90, 2);