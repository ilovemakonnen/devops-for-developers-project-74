start:
	./wait-for-db.sh db:5432 -- npm run start
ci:
	docker compose -f docker-compose.yml up --abort-on-container-exit
	docker compose -f docker-compose.yml down --volumes --remove-orphans
