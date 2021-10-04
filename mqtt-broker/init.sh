#!/bin/bash

# Wait for all assets to be loaded. The last asset is
# the create-databases.sql file.
until [ -f ./docker-compose.yml ] &> /dev/null
do
    sleep 1 &> /dev/null
done

touch /root/init.assets.loaded

# Run the postgres database via the docker-compose command
docker run -d -p 1883:1883 hivemq/hivemq4

# Create an environment.ready file. This file is used to check
# if the initialization process is completed.
touch /root/environment.ready

cd project
npm i mqtt --save