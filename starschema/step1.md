# Postgres einrichten

`docker run \
      --name postgres \
      -e POSTGRES_PASSWORD=yourpassword \
      -p 5432:5432 \
      -d postgres`{{execute}}