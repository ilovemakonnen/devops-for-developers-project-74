#!/bin/sh
until nc -z db 5432; do
  echo "Waiting for postgres..."
  sleep 1
done

npm run start

ci:
	docker compose -f docker-compose.yml up --abort-on-container-exit
	docker compose -f docker-compose.yml down --volumes --remove-orphans
	