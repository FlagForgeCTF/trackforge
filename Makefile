.PHONY: help build up down logs restart clean db-migrate db-seed db-reset shell

# Default target
help:
	@echo "TrackForge Docker Commands:"
	@echo "  make build       - Build the Docker image"
	@echo "  make up          - Start with docker-compose (recommended for local dev)"
	@echo "  make up-swarm    - Start with Docker Swarm"
	@echo "  make down        - Stop containers"
	@echo "  make logs        - View logs from web service"
	@echo "  make restart     - Restart the stack"
	@echo "  make db-migrate  - Run database migrations"
	@echo "  make db-seed     - Seed the database"
	@echo "  make db-reset    - Reset database (migrate + seed)"
	@echo "  make shell       - Open shell in web container"
	@echo "  make console     - Open Rails console"
	@echo "  make clean       - Remove all containers and volumes"
	@echo "  make status      - Show container status"

# Build the Docker image
build:
	docker-compose build

# Start with docker-compose (local development)
up:
	docker-compose up -d
	@echo "Waiting for services to start..."
	@sleep 10
	@echo "Stack deployed! Access at http://localhost:3000"
	@echo "Run 'make db-reset' to initialize the database"

# Start with Docker Swarm (production)
up-swarm:
	docker stack deploy -c prod-stack.yml trackforge
	@echo "Waiting for services to start..."
	@sleep 10
	@echo "Stack deployed!"

# Stop containers
down:
	docker-compose down 2>/dev/null || docker stack rm trackforge 2>/dev/null || true
	@echo "Stopped."

# View logs
logs:
	docker-compose logs -f web

logs-web:
	docker-compose logs -f web

logs-db:
	docker-compose logs -f db

# Restart
restart: down
	@sleep 3
	@make up

# Database operations
db-migrate:
	@echo "Running database migrations..."
	@docker-compose exec web rails db:migrate

db-seed:
	@echo "Seeding database..."
	@docker-compose exec web rails db:seed

db-reset: db-migrate db-seed
	@echo "Database initialized!"

# Precompile assets
assets:
	@echo "Precompiling assets..."
	@docker-compose exec web rails assets:precompile

# Open shell in web container
shell:
	@docker-compose exec web sh

# Rails console
console:
	@docker-compose exec web rails console

# Show status
status:
	docker-compose ps

# Clean everything
clean:
	docker-compose down -v
	@echo "Cleanup complete!"

# Quick start (build + up + db-reset)
quickstart: build up
	@echo "Waiting for services to be ready..."
	@sleep 15
	@make db-reset
	@echo ""
	@echo "✓ TrackForge is ready!"
	@echo "  Access: http://localhost:3000"
