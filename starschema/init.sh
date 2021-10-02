#!/bin/bash

# function print_status {
#     clear

#     if $1; then
#         echo "Umgebung ist bereit."
#     else
#         echo "Umgebung wird vorbereitet..."
#     fi

#     echo "   Dateien $2"
#     echo "   Postgres-Datenbank $3"
# }

function ProgressBar {
    reset
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done

    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

    printf "\rProgress : [${_fill// /#}${_empty// /-}]"
}

# stty flusho
stty -echo

# print_status false ❌ ❌ 

{
    ProgressBar 0 3
    until [ -f ./create-databases.sql ]
    do
        sleep 1
    done
    ProgressBar 1 3
} &> /dev/null

# print_status false ✅ ❌ 

# Run the postgres database via the docker-compose command
docker-compose up -d &> /dev/null
ProgressBar 2 3

until docker exec root_postgres_1 psql -c "\c demo" &> /dev/null
do
    sleep 1
done
ProgressBar 3 3

# Wait for the postgres container to boot up
# ./wait-for-it.sh -t 0 127.0.0.1:5432

# print_status true ✅ ✅ 

touch /root/environment.ready

# stty -flusho
stty echo

docker exec -it root_postgres_1 psql demo
\! clear