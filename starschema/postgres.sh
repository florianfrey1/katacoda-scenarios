# Run the postgres database via the docker-compose command
docker-compose up -d

# Wait for the postgres container to boot up
./wait-for-it.sh -t 0 127.0.0.1:5432 -- echo "postgres database is ready"