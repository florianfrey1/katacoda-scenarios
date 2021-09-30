# Run the postgres database via the docker-compose command
docker-compose up

# Wait for the postgres container to boot up
./wait-for-it.sh -t 0 127.0.0.1:5432

# Initialize the direktory for the node.js projekt (in the
# current /root folder).
npm init -y

# Install the pg module via npm. The pg module is used to
# connect from node js to the postgres databse:
# https://github.com/brianc/node-postgres.
npm i pg

# Clear console and print ready message.
clear
echo "Die Umgebung ist jetzt bereit!"
echo " - Die Postgres-Datenbank ist bereit"
echo " - Das NodeJS-Projekt ist angelegt"