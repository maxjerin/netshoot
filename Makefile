.PHONY: build-amd64 build-arm64 push all

# Build Vars
IMAGENAME=jmathew344/netshoot
VERSION=0.1


.DEFAULT_GOAL := all

build-amd64:
	    @docker build --platform linux/amd64 -t ${IMAGENAME}:${VERSION} .
build-arm64:
		@docker build --platform linux/arm64 -t ${IMAGENAME}:${VERSION} .
build-all:
		@docker buildx build --platform linux/amd64,linux/arm64 --output "type=image,push=false" --file ./Dockerfile .
push:
	 	@docker push ${IMAGENAME}:${VERSION}
all: build-all push



