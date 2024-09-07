SHELL=/bin/bash
.PHONY: pnpm

PODMAN_EXISTS := $(shell command -v podman 2> /dev/null)

ifeq ($(if $(PODMAN_EXISTS),1),1)
  RUNTIME := podman-compose
else
	RUNTIME := docker-compose
endif

# Absolutely awesome: http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-24s\033[0m %s\n", $$1, $$2}'

all: help

start: ## start the containers
	$(RUNTIME) start

stop: ## stop the containers
	$(RUNTIME) stop

down: ## down the containers
	$(RUNTIME) down

create-env: ## copy the example env file
	cp .env.example .env

install-dependencies: ## install dependencies using pnpm
	$(RUNTIME) run --rm node corepack pnpm install

up-d: ## up the container and detach
	$(RUNTIME) up -d

up-build-d: ## up the container, build, and detach
	$(RUNTIME) up --build -d

prisma-studio: ## run prisma studio
	$(RUNTIME) exec -e FORCE_COLOR=1 backend corepack pnpm dlx prisma studio

api-logs:
	$(RUNTIME) logs -f backend

database-logs:
	$(RUNTIME) logs -f database

ps: ## run docker compose ps
	$(RUNTIME) ps

setup: create-env install-dependencies up-build-d ## run setup tasks
