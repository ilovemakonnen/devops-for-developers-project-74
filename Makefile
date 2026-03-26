# Makefile для проекта devops-for-developers-project-74

# Запуск контейнеров для разработки
dev:
	docker run -p 8080:8080 -e NODE_ENV=development ilovemakonnen/devops-for-developers-project-74 make dev

# Сборка production образа
build:
	docker build -f Dockerfile.production -t ilovemakonnen/devops-for-developers-project-74 .

# Запуск тестов с Docker Compose
ci:
	# Ждем, пока база данных будет готова
	until nc -z db 5432; do \
		echo "Waiting for PostgreSQL..."; \
		sleep 1; \
	done
	# Запускаем тесты через Docker Compose
	docker-compose -f docker-compose.yml up --abort-on-container-exit

# Миграции и запуск приложения в production
start:
	npm run migrate
	npm run start

# Очистка контейнеров и томов
clean:
	docker-compose -f docker-compose.yml down -v