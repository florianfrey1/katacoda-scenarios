___
# OLTP-System
Am Beispiel eines einfachen Webshops soll der Unterschied zwischen einem relationalen OLTP- und einem dimensionalen OLAP-System praktisch gezeigt werden.

![Simple Shop Database (OLTP)](oltp_simple_shop_database.svg)
<i style="font-size: 80%">Abbildung 1: Relationales Schema eines einfachen Webshops</i>

In Abbildung 1 ist das relationale Schema des Webshops dargestellt. 

<div style="background: #29bfff; width: 100%; border-radius: 3px; box-sizing: border-box; padding: 20px; margin: 20px 0; color: black">
    <div style="position: relative; font-size: 110%; font-weight: bold">🛈 Tabellen und Demodaten</div>
    <p>Alle Tabellen dieses Beispiels sind bereits in der Datenbank <code>demo</code> angelegt und mit Demodaten gefüllt.</p>
</div>

Nun möchte der Betreiber des Webshops folgende Information abrufen:

> **Eine Liste aller Umsätze pro Artikel in absteigeneder Reihenfolge.**

Die entsprechende Abfrage im OLTP-System sieht wie folgt aus:

<pre class="file" data-filename="app.js" data-target="append">
SELECT
    Artikel.bezeichnung,
    COALESCE(SUM(preis * menge), 0) AS umsatz
FROM Kunde
LEFT JOIN Bestellung
    ON Bestellung.kunde_id = Kunde.id
LEFT JOIN Position
    ON Position.bestellung_id = Bestellung.id
FULL JOIN Artikel
    ON Artikel.id = Position.artikel_id
GROUP BY Artikel.id
ORDER BY umsatz DESC;
</pre>

`SELECT
    Artikel.bezeichnung,
    COALESCE(SUM(preis * menge), 0) AS umsatz
FROM Kunde
LEFT JOIN Bestellung
    ON Bestellung.kunde_id = Kunde.id
LEFT JOIN Position
    ON Position.bestellung_id = Bestellung.id
FULL JOIN Artikel
    ON Artikel.id = Position.artikel_id
GROUP BY Artikel.id
ORDER BY umsatz DESC;`{{execute}}

Folgendes Ergebnis sollte dabei rauskommen:

| bezeichnung  | umsatz |
| :----------- | -----: |
| Schaumbad    |  15.80 |
| Quitscheente |   5.49 |
| Seife        |   5.40 |
| Quatsch      |      0 |