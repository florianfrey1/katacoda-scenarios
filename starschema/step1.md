# Postgres einrichten

Postgres-Datenbank als Docker-Container starten:
`docker run \
      --name postgres-starschema-demo \
      -e POSTGRES_PASSWORD=yourpassword \
      -p 5432:5432 \
      -d postgres
docker wait postgres-starschema-demo`{{execute}}

Postgres CLI starten:
`docker exec -ti -u postgres postgres-starschema-demo psql`{{execute}}

Eine Datenbank anlegen:
`CREATE DATABASE nodedemo; \q`{{execute}}