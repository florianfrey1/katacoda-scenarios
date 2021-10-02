#!/bin/bash

function print_status {
    clear
    echo "Umgebung wird vorbereitet..."
    echo "   Dateien $1"
    echo "   Postgres-Datenbank laden $2"
    echo "   Postgres-Datenbank starten $3"
}

# stty flusho
stty -echo

print_status ⏳ ⏳ ⏳ 

{
    until [ -f ./create-databases.sql ]
    do
        sleep 1
    done
} &> /dev/null

print_status ✅ ⏳ ⏳ 

# Run the postgres database via the docker-compose command
docker-compose up -d &> /dev/null
print_status ✅ ✅ ⏳ 

until docker exec root_postgres_1 psql -c "\c demo" &> /dev/null
do
    sleep 1
done

# Wait for the postgres container to boot up
# ./wait-for-it.sh -t 0 127.0.0.1:5432

print_status ✅ ✅ ✅

touch /root/environment.ready

docker exec -it root_postgres_1 psql demo
\! stty echo
\! clear

# # stty -flusho
# stty echo