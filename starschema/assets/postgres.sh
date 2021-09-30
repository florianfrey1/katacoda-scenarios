# Run the postgres database via the docker-compose command
docker-compose up -d

./wait-for-it.sh -t 0 127.0.0.1:5432 -- echo "postgres database is ready"

# Wait for the postgres container to start up using the small
# dokku/wait container: https://github.com/dokku/docker-wait.
# docker run --net bridge --rm dokku/wait -p 5432

# Create databases.
docker exec -ti -u postgres postgres_database psql
CREATE DATABASE relational;
CREATE DATABASE star;
\q