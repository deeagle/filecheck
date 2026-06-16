CONTAINER_NAME := filecheck-container

PHONY: build/local
build/local:
	docker buildx build \
		--build-arg BUILD_DATE="$(shell date -u +%Y-%m-%dT%H:%M:%SZ)" \
		--build-arg GIT_COMMIT="$(shell git rev-parse HEAD)" \
		--build-arg BUILD_ENVIRONMENT=local \
		-t "$(CONTAINER_NAME):local" -f Dockerfile --load .

PHONY: ci
ci:
	bash run-ci.sh