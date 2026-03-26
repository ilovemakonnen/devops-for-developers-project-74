start:
	./wait-for-db.sh db:5432 -- npm run start

dev:
	docker compose up

test:
	docker compose run --rm app npm test

ci:
	docker compose run --rm app npm test
	docker compose up --build --abort-on-container-exit
	docker compose down -v