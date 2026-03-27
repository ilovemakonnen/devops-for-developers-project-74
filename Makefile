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
	docker compose up -d
	docker compose exec app sh -c "NODE_ENV=test npm run migrate"
	docker compose exec app sh -c "NODE_ENV=test npm test"
	docker compose down -v