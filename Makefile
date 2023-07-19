.DEFAULT_GOAL=help

help: # Show this help
	@echo
	@echo -e "\033[0;32m EuroPython 2023 \033[0m"
	@echo
	@grep -h '\s#\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?# "}; {printf " \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo

login: # Login to Docker Hub
	docker login

build: # Build docker image locally
	docker-compose build

download: # Pull down image from Docker Hub
	docker-compose pull

publish: # Publish  image to Docker Hub
	docker-compose push

run: # Run nvim instance in container
	docker-compose run --rm nvim
