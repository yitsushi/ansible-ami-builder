GIT_VERSION      = $(shell git describe --always --abbrev=7 --dirty)
IMAGE            = ansible-ami-builder
REMOTE           = yitsushi

build: Dockerfile
	docker build -t $(IMAGE):$(GIT_VERSION) .

publish:
	docker tag $(IMAGE):$(GIT_VERSION) $(REMOTE)/$(IMAGE):$(GIT_VERSION)
	docker tag $(IMAGE):$(GIT_VERSION) $(REMOTE)/$(IMAGE):latest
	docker push $(REMOTE)/$(IMAGE):$(GIT_VERSION)
	docker push $(REMOTE)/$(IMAGE):latest
