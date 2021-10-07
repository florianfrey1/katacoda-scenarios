
Das Sternschema ist ein Datenbankmodell für Datawarehouses (Datenlager).
Es ist in der Lage Anfragen auf große Datenmengen effizient auszuführen [2].

# Aufbau

Bei dem Sternschema gibt es zentrale Faktentabellen, die von mehreren Dimensionstabellen umgeben sind (siehe _Abbildung 1_).
Das Sternschema ist eine einfache Form des Schneeflokenschemas (snow flake schema), welches verkettete Dimensionstabellen verwendet.

<img src="star_schema.png" alt="Schematisches Beispiel eines Sternschemas" style="max-width: 350px; width: 100%; display: block">
<i style="font-size: 80%">Abbildung 1: Schematische Darstellung eines Sternschemas.</i>

Eine Faktentabelle enthält die quantitativen Zahlen eines Prozesses - also Metriken und Kennzahlen [3].
Das können beispielsweise Geschäftsereignisse wie Verkaufstransaktionen oder Anmeldungen von Kunden sein [4].
Die Dimensionstabellen ergänzen die Faktentabellen mit beschreibenden, qualitativen Informationen. Diese Informationen dienen zusätzlich zum Filtern und Gruppieren der Fakten.
Während Faktentabellen in der Regel sehr groß ist, weisen Dimensionstabellen nur kleine Größen auf [3].

Der Aufbau einer Faktentabelle besteht zum einen aus den Fremdschlüssel-Attributen, die auf die Dimensionstabellen verweisen, und zum anderen den Fakten-Attributen.
Der Primärschlüssel kann aus den Fremdschlüsseln zusammengesetzt oder ein separates Attribut sein.
Die Dimensionstabellen verfügen über ein Primärschlüssel-Attribut, das von der Faktentabelle referenziert wird, und weiteren Attributen, die die Dimension beschreiben.
Attribute einer Dimensionstabellen haben oft eine hierarchische Verbindung untereinander, was eine sogenannte Drill-Down-Analyse ermöglicht [3].

# Funktionsweise

Ein Datawarehouse bezieht seine Daten aus operativen Datenbanksystemen. Dies kann periodisch in Form von Snapshots oder fortlaufend als Historie aller Updates erfolgen [2]. Während operative Datenbanksysteme für Echtzeiterfassung und -speicherung von Daten optimiert sind, bereiten Datawarehouses die Daten für Analysen auf und halten sie vor [5].

Bei dem Importieren neuer Daten in ein Datawarehouse werden diese aus unterschiedlichen Datenbanken zusammengeführt, vereinheitlicht und in entsprechenden Reports aufbereitet [6], [7]. Reports sind auf bestimmte Fragestellungen und Geschäftsereignisse zugeschnitten und können diese präzise beantworten [3].
Beim Aufbereiten der Daten wird auf schnelle Abfragen Wert gelegt. Die benötigte Dauer zum Speichern der Daten ist dabei zweitrangig [2].

Durch die Verwendung eines Sternschemas im Vergleich zu einem relationalen Schema in Normalform reduziert sich die Anzahl an Joins für eine Anfrage erheblich.
Dadurch können komplizierte Abfragen deutlich effizienter sowie Ad-Hoc Abfragen leichter ausgeführt werden.
Tabellen eines Sternschemas befinden sich nicht in der dritten Normalform nach Boyce Codd [2]. Dadurch nehmen sie mögliche Anomalien in Kauf und weisen keinen optimalen Speicherbedarf auf.

# Verwendung

Ein Datawarehouse ermöglicht bei Verwendung eines Sternschemas eine mehrdimensionale Sicht auf die Daten. Dies ist in _Abbildung 2_ als schematisches Beispiel dargestellt.

<img src="data_cube.png" alt="OLAP Data Cube Beispiel" style="max-width: 350px; width: 100%; display: block">
<i style="font-size: 80%">Abbildung 2: Schematisches Beispiel eines Datenwürfels.</i>

Eine Frage einer Geschäftsanalyse in einer dimensionalen Datenbank könnte folgendermaßen lauten: Wie viele Tablets wurden in Europa und Asien im Jahr 2020 verkauft.
Die Antwort lässt sich durch Eingrenzung der Dimensionen leicht bestimmen.

Das Sternschema zeichnet sich also durch seine einfache Handhabung nicht zuletzt auf der Anwenderseite aus [3].
Daher können auch Angestellte eines Unternehmens ohne fundierte Fachkenntnisse der operativen Datenbanken Analysen für Entscheidungen von Geschäftsprozessen durchführen.