#!/bin/bash

# Print the status to the console.
function print_status {
    clear
    echo "Umgebung wird vorbereitet..."
    echo "   Assets laden $1"
    echo "   Postgres Docker Container laden $2"
    echo "   Postgres Datenbank starten $3"
}

# Suppress all input and outputs to and from the console.
# Hide the cursor.
stty flusho
stty -echo
tput civis

print_status ⏳ ⏳ ⏳

# Wait for all assets to be loaded. The last asset is
# the create-databases.sql file.
until [ -f ./create-databases.sql ] &> /dev/null
do
    sleep 1 &> /dev/null
done

print_status ✅ ⏳ ⏳

# Run the postgres database via the docker-compose command
docker-compose up -d &> /dev/null

print_status ✅ ✅ ⏳

# Wait until the demo database is available via postgres
until docker exec root_postgres_1 psql -c "\c demo" &> /dev/null
do
    sleep 1 &> /dev/null
done

# Wait for two more seconds because errors can occur sometime
# even the previous waiting step was successful
sleep 2

print_status ✅ ✅ ✅

# Create an environment.ready file. This file is used to check
# if the initialization process is completed.
touch /root/environment.ready &> /dev/null

# Start the postgres command line for the demo database.
docker exec -it root_postgres_1 psql demo

# Reset all console settings from inside the postgres command line.
\! stty echo
\! stty -flusho
\! tput cnorm
\! clear