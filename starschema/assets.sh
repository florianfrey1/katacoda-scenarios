#!/bin/bash

# Wait for all assets to be loaded. The last asset is
# the create-databases.sql file.
until [ -f ./create-databases.sql ] &> /dev/null
do
    sleep 1 &> /dev/null
done

touch /root/init.assets.loaded