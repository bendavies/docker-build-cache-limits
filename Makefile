.PHONY: *

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

base: ## Build and tag a base image
	docker buildx build --load --target=base --tag=ghcr.io/bendavies/docker-build-cache-limits:base .

prod: ## Build and tag a prod image
	docker buildx build --load --target=prod --tag=ghcr.io/bendavies/docker-build-cache-limits:prod .