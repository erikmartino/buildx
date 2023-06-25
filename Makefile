IMAGE=xylifyx/buildx
MSG=$(shell date)

all: clean run

clean:
	rm -f build.log
	docker rmi -f $(IMAGE)

build.log: Dockerfile
	docker rmi -f $(IMAGE)
	docker buildx build \
		--build-arg "MSG=$(MSG)" \
		--push -t $(IMAGE) \
		--platform linux/arm64,linux/amd64 \
		. >build.log

build: build.log

push: build
	docker push $(IMAGE)

run: bake
	docker run --platform arm64 --rm $(IMAGE)
	docker run --platform amd64 --rm $(IMAGE)

bake: Dockerfile
	docker buildx bake --push