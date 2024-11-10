SHELL := /bin/bash
PROJECT_NAME?=taskly

USER_ID:=$(shell id -u $$USER)

# Run Docker compose (with CI overrides)
DOCKER_COMPOSE:=docker compose \
  -p $(PROJECT_NAME) \
  -f docker-compose.yml

.PHONY: dev-build
dev-build:
	@docker build --pull -t $(GO_IMG) -f docker/golang/Dockerfile .
	@docker build --pull -t $(PSQL_IMG) -f docker/postgres/Dockerfile .

.PHONY: dev-up
dev-up:
	@$(DOCKER_COMPOSE) up --remove-orphans