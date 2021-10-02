___
# Starschema

 ![Simple Shop Database (OLTP)](olap_simple_shop_database.svg)
<i style="font-size: 80%">Abbildung 1: Dimensionales Schema für ein stark vereinfachtes Data Warehouse des Webshops. Die rote makierte Tabelle ist die Faktentabelle, die grün markierten Tabellen sind die Dimensionstabellen.</i>

`INSERT INTO Verkauf(kunde_id, artikel_id, datum, umsatz, menge)
SELECT kunde_id, artikel_id, datum, preis * menge AS umsatz, menge FROM Kunde
LEFT JOIN Bestellung ON Bestellung.kunde_id = Kunde.id
LEFT JOIN Position ON Position.bestellung_id = Bestellung.id
LEFT JOIN Artikel ON Artikel.id = Position.artikel_id;`{{execute}}

---

Abfragen:

`SELECT Kunde.vorname, COALESCE(SUM(umsatz), 0) AS umsatz FROM Verkauf
FULL JOIN artikel on Kunde.id = Verkauf.kunde_id
GROUP BY Kunde.id
ORDER BY umsatz DESC;`{{execute}}