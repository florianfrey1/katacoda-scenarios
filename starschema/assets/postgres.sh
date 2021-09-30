docker-compose up -d
# while ! docker-compose exec rabbitmq /is_ready.sh; sleep 1; done
docker run --link starschema_demo:starschema_demo --rm dokku/wait -p 5432