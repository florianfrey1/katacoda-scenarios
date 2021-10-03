___
Am Beispiel eines einfachen Webshops soll der Unterschied zwischen einem relationalen OLTP- und einem dimensionalen OLAP-System praktisch gezeigt werden.

<div style="background: #ffb829; width: 100%; border-radius: 3px; box-sizing: border-box; padding: 20px; margin: 20px 0; color: black">
    <div style="position: relative; font-size: 110%; font-weight: bold">⚠ Vereinfachung</div>
    <p>Zur Vereinfachung dieses Beispiels werden beide Systeme gemeinsam in einer Datenbank abgebildet. In der Praxis werden dafür aber mehrere Datenbanken verwendet.</p>
</div>

# Relationales Schema
![Simple Shop Database (OLTP)](./assets/oltp_simple_shop_database.svg)
<i style="font-size: 80%">Abbildung 1: Relationales Schema eines einfachen Webshops</i>

In Abbildung 1 ist das relationale Schema des Webshops dargestellt. 

Nun möchte der Betreiber des Webshops folgende Information abrufen:

> **Eine Liste aller Umsätze nach Kunde für das Jahr 2021 in absteigender Reihenfolge.**

Die entsprechende Abfrage im OLTP-System sieht wie folgt aus:

`SELECT
    Kunde.vorname,
    COALESCE(SUM(preis * menge), 0) AS umsatz
FROM Kunde
LEFT JOIN Bestellung
    ON Bestellung.kunde_id = Kunde.id
LEFT JOIN Position
    ON Position.bestellung_id = Bestellung.id
LEFT JOIN Artikel
    ON Artikel.id = Position.artikel_id
WHERE EXTRACT(year FROM datum) = 2021
GROUP BY Kunde.id
ORDER BY umsatz DESC;`{{execute}}

Folgendes Ergebnis sollte dabei rauskommen:

| bezeichnung | umsatz |
| :---------- | -----: |
| Paul        |   7.90 |
| Paula       |   5.40 |

Um dieses Ergebnis zu erhalten, müssen alle Tabellen des Webshops miteinander verbunden werden: Das entspricht drei Joins. Mit steigender Komplexität eines solchen OLTP-Systems nimmt auch die Anzahl an Joins für analytische Anfragen zu. Um die Analyse der Daten effizienter und einfacher zu gestalten, wurde das Starschema entwickelt.