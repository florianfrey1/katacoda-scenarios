#!/bin/bash

stty flusho
stty -echo
clear
echo "Umgebung wird vorbereitet..."
echo "   Dateien ❌"
echo "   Postgres-Datenbank ❌"
echo "   NodeJS-Umgebung ❌"

{
    until [ -f ./create-databases.sql ]
    do
        sleep 1
    done
} &> /dev/null

clear
echo "Umgebung wird vorbereitet..."
echo "   Dateien ✅"
echo "   Postgres-Datenbank ❌"
echo "   NodeJS-Umgebung ❌"

{
    # Run the postgres database via the docker-compose command
    docker-compose up -d

    # Wait for the postgres container to boot up
    ./wait-for-it.sh -t 0 127.0.0.1:5432
} &> /dev/null

clear
echo "Umgebung wird vorbereitet..."
echo "   Dateien ✅"
echo "   Postgres-Datenbank ✅"
echo "   NodeJS-Umgebung ❌"

{
    # Initialize the direktory for the node.js projekt (in the
    # current /root folder).
    npm init -y


    # Install the pg module via npm. The pg module is used to
    # connect from node js to the postgres databse:
    # https://github.com/brianc/node-postgres.
    npm i pg
} &> /dev/null

clear
echo "Umgebung ist bereit."
echo "   Dateien ✅"
echo "   Postgres-Datenbank ✅"
echo "   NodeJS-Umgebung ✅"

stty -flusho
stty echo