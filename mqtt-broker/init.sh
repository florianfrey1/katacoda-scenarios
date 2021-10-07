#!/bin/bash

# Wait for all assets to be loaded. The last asset is
# the Vorlesungsbezug.png file.
until [ -f ./Vorlesungsbezug.png ] &> /dev/null
do
    sleep 1 &> /dev/null
done

touch /root/assets.ready

# Run the postgres database via the docker-compose command
docker run --name hivemq-ce -d -p 1883:1883 hivemq/hivemq-ce:snapshot
touch /root/hivemq.ready

# Install PM2.
npm i pm2@latest --g
touch /root/pm2.ready

# Initialize the project
cd project
npm init -y
npm i mqtt@latest --save

touch /root/project.ready

# Create an environment.ready file. This file is used to check
# if the initialization process is completed.
touch /root/environment.ready