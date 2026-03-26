start:
	./wait-for-db.sh db:5432 -- npm run start

dev:
	docker compose up --build

test:
	docker compose up -d db
	docker compose run --rm app npm test
	docker compose down -v

ci:
	docker compose up -d db
	docker compose run --rm app sh -c "npx wait-port db:5432 && npm run migrate"
	docker compose run --rm app npm test
	docker compose down -v