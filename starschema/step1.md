# Postgres einrichten

Postgres-Datenbank als Docker-Container starten:
`docker run \
      --name postgres \
      -e POSTGRES_PASSWORD=yourpassword \
      -p 5432:5432 \
      -d postgres`{{execute}}

Postgres CLI starten:
`docker exec -ti -u postgres postgres psql`{{execute}}

Eine Datenbank anlegen:
`CREATE DATABASE nodedemo;`{{execute}}