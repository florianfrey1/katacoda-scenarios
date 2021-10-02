Jetzt zum praktischen Teil! Ein kleines Beispiels eines Webshops soll den Unterschied zwischen einem relationalen OLTP- und einem dimensionalen OLAP-System zeigen.

![Simple Shop Database (OLTP)](oltp_simple_shop_database.svg)
<i style="font-size: 80%">Abbildung 1: Relationales Schema eines stark vereinfachten Webshops</i>

In Abbildung 1 ist das relationale Schema eines stark vereinfachten Webshops dargestellt. Dieses Schema ist in der Datenbank `relational_database` angelegt und mit Demo-Daten gefüllt.

Der Betreiber des Webshops möchte nun folgende Information abrufen:

> Liste aller Umsätze pro Artikel in absteigeneder Reihenfolge.

Das entsprechende SQL-Statement sieht entsprechend wie folgt aus:

`
SELECT Artikel.bezeichnung, COALESCE(SUM(preis * menge), 0) AS umsatz FROM Kunde
LEFT JOIN Bestellung ON Bestellung.kunde_id = Kunde.id
LEFT JOIN Position ON Position.bestellung_id = Bestellung.id
FULL JOIN Artikel ON Artikel.id = Position.artikel_id
GROUP BY Artikel.id
ORDER BY umsatz DESC;
`

```
SELECT Artikel.bezeichnung, COALESCE(SUM(preis * menge), 0) AS umsatz FROM Kunde
LEFT JOIN Bestellung ON Bestellung.kunde_id = Kunde.id
LEFT JOIN Position ON Position.bestellung_id = Bestellung.id
FULL JOIN Artikel ON Artikel.id = Position.artikel_id
GROUP BY Artikel.id
ORDER BY umsatz DESC;
```

---

Abfragen:

SELECT Artikel.bezeichnung, COALESCE(SUM(umsatz), 0) AS umsatz FROM Verkauf
FULL JOIN artikel on Artikel.id = Verkauf.artikel_id
GROUP BY Artikel.id
ORDER BY umsatz DESC;