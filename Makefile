SHELL=/bin/bash
.PHONY: pnpm

# Absolutely awesome: http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-24s\033[0m %s\n", $$1, $$2}'

all: help

start: ## start the containers
	docker compose start

stop: ## stop the containers
	docker compose stop

down: ## down the containers
	docker compose down

create-env: ## copy the example env file
	cp .env.example .env

install-dependencies: ## install dependencies using pnpm
	docker compose run --rm backend corepack pnpm install

up-d: ## up the container and detach
	docker compose up -d

up-build-d: ## up the container, build, and detach
	docker compose up --build -d

prisma-studio: ## run prisma studio
	docker compose exec backend corepack pnpm dlx prisma studio

api-logs:
	docker compose logs -f backend

database-logs:
	docker compose logs -f database

ps: ## run docker compose ps
	docker compose ps

setup: create-env install-dependencies up-build-d ## run setup tasks
