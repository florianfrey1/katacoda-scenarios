#!/bin/bash

# Wait for all assets to be loaded. The last asset is
# the create-databases.sql file.
until [ -f ./project/test.js ] &> /dev/null
do
    sleep 1 &> /dev/null
done

touch /root/assets.ready

# Run the postgres database via the docker-compose command
docker run --name hivemq-ce -d -p 1883:1883 hivemq/hivemq-ce:snapshot
touch /root/hivemq.ready

# Initialize the project
cd project
npm init -y
npm i mqtt --save

touch /root/project.ready

# Create an environment.ready file. This file is used to check
# if the initialization process is completed.
touch /root/environment.ready