# Postgres einrichten

Postgres-Datenbank als Docker-Container starten:
`docker run \
      --name postgres_starschema_demo \
      -e POSTGRES_PASSWORD=yourpassword \
      -p 5432:5432 \
      -d postgres`{{execute}}

> ⚠ **Startzeit des Docker-Containers**: Das Starten eines Docker-Containers kann etwas Zeit in Anspruch nehmen. Wird der nachfolgende Befehl zu früh ausgeführt, kann es dementsprechend zu einem Fehler kommen.

Postgres CLI starten:
`docker exec -ti -u postgres postgres_starschema_demo psql`{{execute}}

Eine Datenbank anlegen:
`CREATE DATABASE nodedemo; \q`{{execute}}