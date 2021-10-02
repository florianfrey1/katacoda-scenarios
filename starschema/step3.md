Konvertierung:

> Liste aller Umsätze pro Artikel in absteigeneder Reihenfolge.

![Simple Shop Database (OLTP)](oltp_simple_shop_database.svg)

Select Artikel.bezeichnung, COALESCE(sum(preis * menge), 0) as umsatz from Kunde
LEFT JOIN Bestellung on Bestellung.kunde_id = Kunde.id
LEFT JOIN Position on Position.bestellung_id = Bestellung.id
FULL JOIN Artikel on Artikel.id = Position.artikel_id
GROUP BY Artikel.id
ORDER BY umsatz DESC;

---

Abfragen:

SELECT Artikel.bezeichnung, COALESCE(sum(umsatz), 0) as umsatz FROM Verkauf
FULL JOIN artikel on Artikel.id = Verkauf.artikel_id
GROUP BY Artikel.id
ORDER BY umsatz DESC;