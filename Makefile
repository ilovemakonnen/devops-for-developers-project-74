start:
	./wait-for-db.sh db:5432 -- npm run start

dev:
	docker compose up --build

test:
	docker compose up -d
	docker compose exec app npm test -s

ci:
	docker compose up -d
	docker compose exec app sh -c "NODE_ENV=test npm run migrate"
	docker compose exec app sh -c "NODE_ENV=test npm test"
	docker compose down -v