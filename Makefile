start:
	./wait-for-db.sh db:5432 -- npm run start

dev:
	docker compose up

test:
	docker compose run --rm app npm test

ci:
	docker compose up -d db
	docker compose run --rm app npm test
	docker compose down -v