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
	docker compose run --rm app sh -c 'until echo > /dev/tcp/db/5432 2>/dev/null; do sleep 1; done'
	docker compose run --rm app npm run migrate
	docker compose run --rm app npm test
	docker compose down -v