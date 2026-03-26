start:
	./wait-for-db.sh db:5432 -- npm run start

dev:
	docker compose up --build

test:
	docker compose up -d db
	./wait-for-db.sh db:5432
	docker compose run --rm app npm test
	docker compose down -v

ci:
	docker compose up -d db
	docker compose run --rm app sh -c "until pg_isready -h db -p 5432 -U postgres; do sleep 1; done && npm run migrate"
	docker compose run --rm app npm test
	docker compose down -v