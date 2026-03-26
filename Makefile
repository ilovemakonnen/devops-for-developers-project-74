run-tests:
	docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

start-dev:
	export NODE_ENV="development"; docker compose up --build
	
start-prod:
	docker compose -f docker-compose.yml up --build

setup-local:
	docker compose run --rm --no-deps app make setup