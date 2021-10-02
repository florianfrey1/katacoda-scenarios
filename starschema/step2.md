In einem Data Warehouse müssen effizient Anfragen auf große Datenmengen ausgeführt werden können. Dabei liegt der Fokus vorwiegend auf dem Lesen und nicht dem Schreiben der Daten. Dafür eignet sich das Sternschema (star schema) besonders gut. [Vavouras2000]

Das Sternschema hat seine Bezeichnung von der sternförmigen Anordnung vieler Entitäten um eine zentrale Entität. Die zentrale Entität wird als Faktentabelle und die äußeren Entitäten als Dimensionstabellen bezeichnet. Die Faktentabelle enthällt sogenannte Geschäftsereignisse, wie beispielsweise Verkaufstransaktionen oder Anmeldung von Kunden. [Corral2006]

OLTP:
- Viele einzelne, normalisierte Tabellen müssen für eine analytische Anfrage miteinander verbunden werden ==> aufwendig
- keine Redundanz

OLAP: nicht normalisiert ==> duplizierte Daten können auftrefen

Star-Schema: Dimensional Data Model (Ralph Kimball Methodology)

Dimensionen: Beschreibende Entitäten

Ad-Hoc Abfragen leichter möglich (weniger Joins)


<!-- # Schneeflocken- vs Sternschema -->