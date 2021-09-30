#!/bin/bash

stty flusho
stty -echo
tput clear
echo "Umgebung wird vorbereitet..."
tput cup 3 1
echo "Dateien ❌"
tput cup 3 2
echo "Postgres-Datenbank ❌"
tput cup 3 3
echo "NodeJS-Umgebung ❌"

until [ -f ./setup.sh ]
do
     sleep 1
done

tput cup 3 1
echo "Dateien ✅"

# Run the postgres database via the docker-compose command
docker-compose up -d &> /dev/null

# Wait for the postgres container to boot up
./wait-for-it.sh -t 0 127.0.0.1:5432 &> /dev/null

tput cup 3 2
echo "Postgres-Datenbank ✅"

# Initialize the direktory for the node.js projekt (in the
# current /root folder).
npm init -y &> /dev/null


# Install the pg module via npm. The pg module is used to
# connect from node js to the postgres databse:
# https://github.com/brianc/node-postgres.
npm i pg &> /dev/null

tput cup 3 3
echo "NodeJS-Umgebung ✅"
tput cup 0 0
echo "Umgebung ist bereit."

stty -flusho
stty echo