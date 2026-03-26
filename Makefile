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
	chmod +x wait-for-db.sh
	docker compose up -d db
	./wait-for-db.sh db:5432
	docker compose run --rm app npm run migrate
	docker compose run --rm app npm test
	docker compose down -v