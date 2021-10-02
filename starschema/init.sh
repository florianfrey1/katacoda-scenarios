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

progress-bar() {
  local duration=${1}


    already_done() { for ((done=0; done<$elapsed; done++)); do printf "▇"; done }
    remaining() { for ((remain=$elapsed; remain<$duration; remain++)); do printf " "; done }
    percentage() { printf "| %s%%" $(( (($elapsed)*100)/($duration)*100/100 )); }
    clean_line() { printf "\r"; }

  for (( elapsed=1; elapsed<=$duration; elapsed++ )); do
      already_done; remaining; percentage
      sleep 1
      clean_line
  done
  clean_line
}

# stty flusho
stty -echo

# print_status false ❌ ❌ 

{
    progress-bar 20
    until [ -f ./create-databases.sql ]
    do
        sleep 1
    done
    progress-bar 40
} &> /dev/null

# print_status false ✅ ❌ 

# Run the postgres database via the docker-compose command
docker-compose up -d &> /dev/null
progress-bar 80

until docker exec root_postgres_1 psql -c "\c demo" &> /dev/null
do
    sleep 1
done
progress-bar 100

# Wait for the postgres container to boot up
# ./wait-for-it.sh -t 0 127.0.0.1:5432

# print_status true ✅ ✅ 

touch /root/environment.ready

# stty -flusho
stty echo

docker exec -it root_postgres_1 psql demo
\! clear