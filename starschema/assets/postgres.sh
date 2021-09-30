# Run the postgres database via the docker-compose command
docker-compose up -d

# Wait for the postgres container to start up using the small
# dokku/wait container: https://github.com/dokku/docker-wait.
docker run --net bridge --rm dokku/wait -p 5432

# Create databases.
docker exec -ti -u postgres postgres_database psql -f ./databases/relational-schema.sql \q

# Initialize the direktory for the node.js projekt (in the
# current /root folder).
npm init -y

# Install the pg module via npm. The pg module is used to
# connect from node js to the postgres databse:
# https://github.com/brianc/node-postgres.
npm i pg