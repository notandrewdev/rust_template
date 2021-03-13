#########
# Build #
#########

build: prod-build dev-build docker-build-prod

build-prod:
	cargo build --release

build-dev:
	cargo build

build-docker-prod:
	docker build -f docker/Dockerfile -t docker_username/project_name:latest .

build-docker-dev:
	docker build -f docker/dev.Dockerfile -t docker_username/project_name:dev .

########
# Lint #
########

lint: lint-rust lint-dockerfiles

lint-rust:
	rustfmt --check src/main.rs

lint-dockerfiles:
	hadolint docker/Dockerfile
	hadolint docker/dev.Dockerfile