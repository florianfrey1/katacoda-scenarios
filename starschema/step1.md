# Postgres einrichten

Im ersten Schritt legen wir eine neue Postgres-Datenbank an.

Dafür verwenden in diesem Beispiel Docker für das Ausführen der Postgres-Datenbank:

`docker run \
      --name postgres_starschema_demo \
      -e POSTGRES_PASSWORD=password \
      -p 5432:5432 \
      -d postgres`{{execute}}

> 🛈 **Beschreibung**<br>
> 1. --name: Name der Datenbank.
> 1. -e POSTGRES_PASSWORD: Passwort der Datenbank.
> 1. -p: Portmapping eines internen auf einen externen Port.
> 1. -d: Das Docker-Image.

> ⚠ **Startzeit des Docker-Containers**: Das Starten eines Docker-Containers kann etwas Zeit in Anspruch nehmen. Wird der nachfolgende Befehl zu früh ausgeführt, kann es dementsprechend zu einem Fehler kommen.

Postgres CLI starten:
`docker exec -ti -u postgres postgres_starschema_demo psql`{{execute}}

Eine Datenbank anlegen:
`CREATE DATABASE starschema_demo; \q`{{execute}}