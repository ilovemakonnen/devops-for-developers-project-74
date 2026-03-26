start:
	./wait-for-db.sh db:5432 -- npm run start
ci:
	docker compose run --rm app npm test
test:
	npm test
