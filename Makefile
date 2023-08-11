REGISTRY_HOST := ghcr.io/anniemartina
NAME := myhttpserver/trdl
TAG := 3
CONTAINER_NAME := trdl
VOL_MNTS := -v /sys/fs/cgroup:/sys/fs/cgroup -v /lib/modules:/lib/modules

.PHONY: build pull launch upload

build:
	docker build -t $(REGISTRY_HOST)/$(NAME):$(TAG) .

pull:
	docker pull $(REGISTRY_HOST)/$(NAME):$(TAG)

launch::
	docker run -itd --name $(CONTAINER_NAME) --privileged -e container=docker -p 80:80 $(VOL_MNTS) $(REGISTRY_HOST)/$(NAME):$(TAG)

rm:
	docker rm $(CONTAINER_NAME)

upload:
	docker push $(REGISTRY_HOST)/$(NAME):$(TAG)

clean:
	docker rm -v `docker ps -a -q  -f status=exited -f name=$(CONTAINER_NAME)`
