REGISTRY_HOST := ghcr.io/anniemartina
NAME := myhttpserver/trdl
TAG := 1
CONTAINER_NAME := trdl
VOL_MNTS := -v /sys/fs/cgroup:/sys/fs/cgroup -v /lib/modules:/lib/modules

.PHONY: test build pull launch upload

lint:
	pylint -E trdl.py

test: lint
	pytest

build: test
	docker build -t $(REGISTRY_HOST)/$(NAME):$(TAG) .

pull:
	docker pull $(REGISTRY_HOST)/$(NAME):$(TAG)

launch:
	docker run --name $(CONTAINER_NAME) -p 80:80 -d $(REGISTRY_HOST)/$(NAME):$(TAG)

rm:
	docker rm $(CONTAINER_NAME)

upload:
	docker push $(REGISTRY_HOST)/$(NAME):$(TAG)

clean:
	docker rm -v `docker ps -a -q  -f status=exited -f name=$(CONTAINER_NAME)`
