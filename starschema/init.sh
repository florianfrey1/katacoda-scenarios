#!/bin/bash

node /root/hi.js

function print_status {
    clear

    if $1; then
        echo "Umgebung ist bereit."
    else
        echo "Umgebung wird vorbereitet..."
    fi

    echo "   Dateien $2"
    echo "   Postgres-Datenbank $3"
    echo "   NodeJS-Umgebung $4"
}  

stty flusho
stty -echo

print_status false ❌ ❌ ❌

{
    until [ -f ./create-databases.sql ]
    do
        sleep 1
    done
} &> /dev/null

print_status false ✅ ❌ ❌

{
    # Run the postgres database via the docker-compose command
    docker-compose up -d

    # Wait for the postgres container to boot up
    ./wait-for-it.sh -t 0 127.0.0.1:5432
} &> /dev/null

print_status false ✅ ✅ ❌

{
    # Create project folder.
    mkdir project

    # Go to the project folder.
    cd project

    # Initialize the direktory for the node.js projekt (in the
    # current /root folder).
    npm init -y

    # Install the pg module via npm. The pg module is used to
    # connect from node js to the postgres databse:
    # https://github.com/brianc/node-postgres.
    npm i pg
} &> /dev/null

print_status true ✅ ✅ ✅

touch /root/environment.ready

stty -flusho
stty echo