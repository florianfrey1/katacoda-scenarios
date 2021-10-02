#!/bin/bash

function print_status {
    clear

    if $1; then
        echo "Umgebung ist bereit."
    else
        echo "Umgebung wird vorbereitet..."
    fi

    echo "   Dateien $2"
    echo "   Postgres-Datenbank $3"
}  

stty flusho
stty -echo

print_status false ❌ ❌ 

{
    until [ -f ./create-databases.sql ]
    do
        sleep 1
    done
} &> /dev/null

print_status false ✅ ❌ 

{
    # Run the postgres database via the docker-compose command
    docker-compose up -d

    # Wait for the postgres container to boot up
    ./wait-for-it.sh -t 0 127.0.0.1:5432
} &> /dev/null

print_status true ✅ ✅ 

touch /root/environment.ready

stty -flusho
stty echo

# until docker exec root_postgres_1 pg_isready ; do sleep 5 ; done
# echo  "pg is ready"

until docker exec -it root_postgres_1 psql demo &>/dev/null
do
  echo "Waiting for PostgreSQL..."
  sleep 1
done

echo "READY"

# docker ps

# until ["$( docker container inspect -f '{{.State.Health}}' root_postgres_1 )" != "healthy"]
# do
#     echo "$( docker container inspect -f '{{.State.Health}}' root_postgres_1 )"
#     sleep 1
# done
# docker exec -it root_postgres_1 psql demo