
IMAGE=xylifyx/buildx

all: clean run

clean:
	rm -f build.log
	docker rmi -f $(IMAGE)

build.log: Dockerfile
	docker rmi -f $(IMAGE)
	docker buildx build -t $(IMAGE) --load --platform linux/arm64 . >build.log

build: build.log

push: build
	docker push $(IMAGE)

run: build
	docker run --rm $(IMAGE)
