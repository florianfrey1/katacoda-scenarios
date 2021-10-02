#!/bin/bash

function print_status {
    clear
    echo "Umgebung wird vorbereitet..."
    echo "   Assets laden $1"
    echo "   Postgres Docker Container laden $2"
    echo "   Postgres Datenbank starten $3"
}

stty flusho
stty -echo
tput civis

print_status ⏳ ⏳ ⏳ &> /dev/null

{
    until [ -f ./create-databases.sql ] &> /dev/null
    do
        sleep 1 &> /dev/null
    done
} &> /dev/null

print_status ✅ ⏳ ⏳ &> /dev/null

# Run the postgres database via the docker-compose command
docker-compose up -d &> /dev/null
print_status ✅ ✅ ⏳ &> /dev/null

until docker exec root_postgres_1 psql -c "\c demo" &> /dev/null
do
    sleep 1
done

sleep 2

print_status ✅ ✅ ✅ &> /dev/null

touch /root/environment.ready &> /dev/null

docker exec -it root_postgres_1 psql demo
\! stty echo
\! stty -flusho
\! tput cnorm
\! clear