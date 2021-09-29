# Postgres einrichten

Postgres-Datenbank als Docker-Container starten:
`docker run \
      --name postgres_starschema_demo \
      -e POSTGRES_PASSWORD=yourpassword \
      -p 5432:5432 \
      -d postgres
docker wait postgres_starschema_demo`{{execute}}

Postgres CLI starten:
`docker exec -ti -u postgres postgres_starschema_demo psql`{{execute}}

Eine Datenbank anlegen:
`CREATE DATABASE nodedemo; \q`{{execute}}