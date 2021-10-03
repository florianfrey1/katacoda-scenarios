
Das Sternschema ist ein Datenbankmodell für Datawarehouses (Datenlager). Es ist in der Lage Anfragen auf große Datenmengen effizient auszuführen [Vavouras2000].

# Aufbau

Bei dem Sternschema gibt es zentrale Faktentabellen, die von mehreren Dimensionstabellen umgeben sind (siehe _Abbildung 1_).
Das Sternschema ist eine einfache Form des Schneeflokenschemas (snow flake schema), welches verkettete Dimensionstabellen hat.

<img src="assets/star_schema.png" alt="Schematisches Beispiel eines Sternschemas" style="max-width: 350px; display: block">
<i style="font-size: 80%">Abbildung 1: Schematische Darstellung eines Sternschemas.</i>

Eine Faktentabelle enthält die quantitativen Zahlen eines Vorgangs [Corr2011].
Das können beispielsweise Geschäftsereignisse wie Verkaufstransaktionen oder Anmeldung von Kunden sein [Corral2006].
Die Dimensionstabellen ergänzen die Faktentabellen mit beschreibenden, qualitativen Informationen [Corr2011].

# Funktionsweise

Ein Datawarehouse bezieht seine Daten aus operativen Datenbanksystemen. Dies kann periodisch in Form von Snapshots oder fortlaufend als Historie aller Updates erfolgen [Vavouras2000]. Während operative Datenbanksysteme für Echtzeit-Erfassung und -Speicherung von Daten optimiert sind, bereiten Datawarehouses die Daten für Analysen auf und halten sie vor [Inmon2020].

Bei dem Importieren neuer Daten in ein Datawarehouse werden diese aus unterschiedlichen Datenbanken zusammengeführt, vereinheitlicht und in entsprechenden Reports aufbereitet [Manhart2008, documentation2021]. Reports sind auf bestimmte Fragestellungen und Geschäftsereignisse zugeschnitten und können diese präzise beantworten [Corr2011].
Beim Aufbereiten der Daten wird auf schnelle Abfragen Wert gelegt. Die benötigte Dauer zum Speichern der Daten ist dabei zweitrangig [Vavouras2000].

Durch die Verwendung eines Sternschemas im Vergleich zu einem relationalen Schema in Normalform reduziert sich die Anzahl an Joins für eine Anfrage erheblich.
Dadurch können komplizierte Abfragen deutlich effizienter sowie Ad-Hoc Abfragen leichter ausgeführt werden.
Tabellen eines Sternschemas befinden sich nicht in der dritten Normalform nach Boyce Codd [Corr2011].

# Verwendung

Ein Datawarehouse ermöglicht durch die Online Analytical Processing (OLAP) Methode eine mehrdimensionale Sicht auf die Daten. Dies ist in _Abbildung 2_ als schematisches Beispiel dargestellt.

<img src="assets/data_cube.png" alt="OLAP Data Cube Beispiel" style="max-width: 350px; display: block">
<i style="font-size: 80%">Abbildung 2: Schematisches Beispiel eines Datenwürfels.</i>

Durch die einfache Auswahl von Dimensionen können bestimmte Geschäftsanalysen schnell durchgeführt werden.
Beispielsweise: Wie viele Tablets wurden in Europa und Asien im Jahr 2020 verkauft.

Das Sternschema zeichnet sich also durch seine einfache Handhabung auf der Anwenderseite aus [Corr2011].
Daher können auch Angestellte eines Unternehmens ohne fundierte Fachkenntnisse der operativen Datenbanken Analysen für Entscheidungen von Geschäftsprozessen durchführen.

<!-- OLAP:
- nicht normalisiert ==> duplizierte Daten können auftreten (Daten werden nicht gelöscht, es wird stattdessen ein neues Tupel mit den geänderten Informationen eingefügt)

Star-Schema: Dimensional Data Model (Ralph Kimball Methodology) -->