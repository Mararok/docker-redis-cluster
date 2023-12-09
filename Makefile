PROJECT='test-redis-cluster'
IMAGE_REPOSITORY = mararok/test-redis-cluster
REDIS_VERSION ?= 7.2
IMAGE_DOCKERFILE=$(REDIS_VERSION)/Dockerfile
IMAGE_TAG=$(IMAGE_REPOSITORY):$(REDIS_VERSION)
IMAGE_LATEST_TAG = "$(IMAGE_REPOSITORY):latest"
build:
	docker build -f "$(IMAGE_DOCKERFILE)" -t "$(IMAGE_TAG)" -t "$(IMAGE_LATEST_TAG)" .
push: build
	docker push "$(IMAGE_TAG)"
	docker push "$(IMAGE_LATEST_TAG)"
up:
	docker compose -p $(PROJECT) --env-file=$(REDIS_VERSION)/.env up -d --wait --wait-timeout 3
down:
	docker compose -p $(PROJECT) down -t 2