# Willkommen

In einem heutigen Datawarehouse werden große Datenmengen aus operativen Systemen analysiert und ausgewertet.
Dabei spielt die Organisation und Aufbereitung der Daten eine zentrale Rolle.
Um dies effizient, übersichtlich und intuitiv zu gestalten, wird häufig das Sternschema für Datawarehouses verwendet.
In dieser Katacoda wird der Aufbau, die Funktionsweise sowie die Verwendung beschrieben.
Im praktischen Teil wird eine Konvertierung von Daten aus einem operativen, relationalen System in ein Sternschema basiertes Datawarehouse demonstriert.
In _Abbildung 1_ ist dieser Vorgang schematisch skizziert: Aus den Online Transaction Processing (OLTP) Systemen werden die Daten entnommen und in das Warehouse, das nach dem Online Analytical Processing (OLAP) Prinzip arbeitet, überführt. Bei OLTP-Systemen liegt der Fokus auf der Echtzeitausführung von Transaktionen und mit OLAP-Systemen lassen sich große mehrdimensionale Datenmengen analysieren.

<img src="assets/oltp-vs-olap.png" alt="OLTP vs OLAP" style="max-width: 450px; width: 100%; display: block">
<i style="font-size: 80%">Abbildung 1: OLTP vs OLAP [1].</i>