
Das Sternschema ist ein Datenbankmodell für Datawarehouses (Datenlager).
Es ist in der Lage Anfragen auf große Datenmengen effizient auszuführen [1].

# Aufbau

Bei dem Sternschema gibt es zentrale Faktentabellen, die von mehreren Dimensionstabellen umgeben sind (siehe _Abbildung 1_).
Das Sternschema ist eine einfache Form des Schneeflokenschemas (snow flake schema), welches verkettete Dimensionstabellen verwendet.

<img src="assets/star_schema.png" alt="Schematisches Beispiel eines Sternschemas" style="max-width: 350px; display: block">
<i style="font-size: 80%">Abbildung 1: Schematische Darstellung eines Sternschemas.</i>

Eine Faktentabelle enthält die quantitativen Zahlen eines Vorgangs [2].
Das können beispielsweise Geschäftsereignisse wie Verkaufstransaktionen oder Anmeldungen von Kunden sein [3].
Die Dimensionstabellen ergänzen die Faktentabellen mit beschreibenden, qualitativen Informationen [2].

# Funktionsweise

Ein Datawarehouse bezieht seine Daten aus operativen Datenbanksystemen. Dies kann periodisch in Form von Snapshots oder fortlaufend als Historie aller Updates erfolgen [1]. Während operative Datenbanksysteme für Echtzeiterfassung und -speicherung von Daten optimiert sind, bereiten Datawarehouses die Daten für Analysen auf und halten sie vor [4].

Bei dem Importieren neuer Daten in ein Datawarehouse werden diese aus unterschiedlichen Datenbanken zusammengeführt, vereinheitlicht und in entsprechenden Reports aufbereitet [5], [6]. Reports sind auf bestimmte Fragestellungen und Geschäftsereignisse zugeschnitten und können diese präzise beantworten [2].
Beim Aufbereiten der Daten wird auf schnelle Abfragen Wert gelegt. Die benötigte Dauer zum Speichern der Daten ist dabei zweitrangig [1].

Durch die Verwendung eines Sternschemas im Vergleich zu einem relationalen Schema in Normalform reduziert sich die Anzahl an Joins für eine Anfrage erheblich.
Dadurch können komplizierte Abfragen deutlich effizienter sowie Ad-Hoc Abfragen leichter ausgeführt werden.
Tabellen eines Sternschemas befinden sich nicht in der dritten Normalform nach Boyce Codd [2].

# Verwendung

Ein Datawarehouse ermöglicht bei Verwendung eines Sternschemas eine mehrdimensionale Sicht auf die Daten. Dies ist in _Abbildung 2_ als schematisches Beispiel dargestellt.

<img src="assets/data_cube.png" alt="OLAP Data Cube Beispiel" style="max-width: 350px; display: block">
<i style="font-size: 80%">Abbildung 2: Schematisches Beispiel eines Datenwürfels.</i>

Eine Frage einer Geschäftsanalyse in einer dimensionalen Datenbank könnte folgendermaßen lauten: Wie viele Tablets wurden in Europa und Asien im Jahr 2020 verkauft.
Die Antwort lässt sich durch Eingrenzung der Dimensionen leicht bestimmen.

Das Sternschema zeichnet sich also durch seine einfache Handhabung nicht zuletzt auf der Anwenderseite aus [2].
Daher können auch Angestellte eines Unternehmens ohne fundierte Fachkenntnisse der operativen Datenbanken Analysen für Entscheidungen von Geschäftsprozessen durchführen.