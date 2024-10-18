IMAGE_NAME = kastmates-flutter 

build:
	docker compose -f docker-compose.yaml build

command:
	docker exec -it ${IMAGE_NAME} /bin/bash

command-raw:
	docker compose run ${IMAGE_NAME} bash

up:
	docker compose -f docker-compose.yaml up

build-web:
	docker compose -f docker-compose.yaml run ${IMAGE_NAME} flutter build web
