#!/bin/bash

# Wait for all assets to be loaded. The last asset is
# the create-databases.sql file.
until [ -f ./create-databases.sql ] &> /dev/null
do
    sleep 1 &> /dev/null
done

touch /root/init.assets.loaded

# Run the postgres database via the docker-compose command
docker-compose up -d &> /dev/null

touch /root/init.docker.container.loaded

# Wait until the demo database is available via postgres
until docker exec root_postgres_1 psql -c "\c demo" &> /dev/null
do
    sleep 1 &> /dev/null
done

# Wait one more second because errors can occur sometime
# even the previous waiting step was successful
sleep 1

touch /root/init.postgres.started

# Create an environment.ready file. This file is used to check
# if the initialization process is completed.
touch /root/environment.ready