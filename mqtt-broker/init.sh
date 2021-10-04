#!/bin/bash

# Wait for all assets to be loaded. The last asset is
# the create-databases.sql file.
# until [ -f ./create-databases.sql ] &> /dev/null
# do
#     sleep 1 &> /dev/null
# done

# touch /root/init.assets.loaded

# Run the postgres database via the docker-compose command
docker-compose up -d

# Create an environment.ready file. This file is used to check
# if the initialization process is completed.
touch /root/environment.ready