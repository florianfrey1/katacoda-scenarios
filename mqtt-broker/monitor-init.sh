#!/bin/bash

# Print the status to the console.
function print_status {
    clear
    echo "Umgebung wird vorbereitet..."
    echo "   Assets laden $1"
    echo "   Postgres Docker Container laden $2"
    echo "   Postgres Datenbank starten $3"
}

function wait_for {
    until [ -f $1 ] &> /dev/null
    do
        sleep 1 &> /dev/null
    done

    rm -r $1 &> /dev/null
}

# Suppress all input and outputs to and from the console.
# Hide the cursor.
stty flusho
stty -echo
tput civis

print_status ⏳ ⏳ ⏳
wait_for ./init.assets.loaded
print_status ✅ ⏳ ⏳
wait_for ./init.docker.container.loaded
print_status ✅ ✅ ⏳
wait_for ./init.postgres.started
print_status ✅ ✅ ✅

# Start the postgres command line for the demo database.
docker exec -it root_postgres_1 psql demo

# Reset all console settings from inside the postgres command line.
\! stty echo
\! stty -flusho
\! tput cnorm
\! clear