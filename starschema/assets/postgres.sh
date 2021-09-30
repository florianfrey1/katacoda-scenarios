# Run the postgres database via the docker-compose command
docker-compose up -d

# Wait for the postgres container to start up using the small
# dokku/wait container: https://github.com/dokku/docker-wait.
# docker run --net bridge --rm dokku/wait -p 5432

wget https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait
chmod +x wait
./wait

# Create databases.
docker exec -ti -u postgres postgres_database psql
CREATE DATABASE relational;
CREATE DATABASE star;
\q