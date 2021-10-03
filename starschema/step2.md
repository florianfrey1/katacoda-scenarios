
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

Bei dem Importieren neuer Daten in ein Datawarehouse werden diese aus unterschiedlichen Datenbanken zusammengeführt, vereinheitlicht und in entsprechenden Reports aufbereitet [Manhart2008, documentation2021].
Beim Aufbereiten der Daten wird darauf Wert gelegt schnelle Abfragen zu ermöglichen. Die benötigte Dauern zum Speichern der Daten ist zweitrangig [Vavouras2000].

<!-- Ad-Hoc Abfragen leichter möglich (weniger Joins) -->

# Verwendung

Ein Datawarehouse ermöglicht durch die Online Analytical Processing (OLAP) Methode eine mehrdimensionale Sicht auf die Daten. Dies ist in _Abbildung 2_ als schematisches Beispiel dargestellt.

<img src="assets/data_cube.png" alt="OLAP Data Cube Beispiel" style="max-width: 350px; display: block">
<i style="font-size: 80%">Abbildung 2: Schematisches Beispiel eines Datenwürfels.</i>

Durch die einfache Einschränkung von Dimensionen können bestimmte Geschäftsanalysen schnell durchgeführt werden. Beispielsweise: Wie viele Tablets wurden in Europa und Asien im Jahr 2020 verkauft.

Einfachheit [Corr2011]

OLAP ist die Abkürzung für Online Analytical Processing und stellt die Softwarekategorie zur Datenanalyse dar.

OLTP:
- Viele einzelne, normalisierte Tabellen müssen für eine analytische Anfrage miteinander verbunden werden ==> aufwendig
- keine Redundanz
- Echtzeit-Datenverarbeitung

OLAP:
- nicht normalisiert ==> duplizierte Daten können auftreten (Daten werden nicht gelöscht, es wird stattdessen ein neues Tupel mit den geänderten Informationen eingefügt)
- Analyse
- integrated Data
- historical Data (Snapshots, not Updates)

Transformierung: Vereinheitlichung und Erstellung von Reports ==> Entscheidung für Geschäftsprozesse 

Star-Schema: Dimensional Data Model (Ralph Kimball Methodology)