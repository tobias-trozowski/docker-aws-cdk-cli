AWS_CDK_VERSION = 2.105.0
IMAGE_NAME ?= tobiastrozowski/aws-cdk-cli:$(AWS_CDK_VERSION)
TAG = $(AWS_CDK_VERSION)

build:
	docker build --build-arg="AWS_CDK_VERSION=$(AWS_CDK_VERSION)" -t $(IMAGE_NAME) .

test:
	docker run --rm -it $(IMAGE_NAME) --version

shell:
	docker run --rm -it --entrypoint sh -v ~/.aws:/root/.aws -v $(shell pwd):/opt/app $(IMAGE_NAME) bash

gitTag:
	-git tag -d $(TAG)
	-git push origin :refs/tags/$(TAG)
	git tag $(TAG)
	git push origin $(TAG)
