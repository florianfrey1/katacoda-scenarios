#!/bin/bash

stty flusho
stty -echo
clear
echo "Die Umgebung wird vorbereitet..."

until [ -f ./setup.sh ]
do
     sleep 1
done

echo "Dateien sind geladen ✅"

# Run the postgres database via the docker-compose command
docker-compose up -d &> /dev/null

# Wait for the postgres container to boot up
./wait-for-it.sh -t 0 127.0.0.1:5432 &> /dev/null

echo "Postgres-Datenbank ✅"

# Initialize the direktory for the node.js projekt (in the
# current /root folder).
npm init -y &> /dev/null


# Install the pg module via npm. The pg module is used to
# connect from node js to the postgres databse:
# https://github.com/brianc/node-postgres.
npm i pg &> /dev/null

echo "NodeJS-Umgebung ✅"

stty -flusho

clear
echo "Die Umgebung ist bereit!"
echo " - Die Postgres-Datenbank ist bereit"
echo " - Das NodeJS-Projekt ist angelegt"

stty echo