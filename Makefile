

build.log: Dockerfile
	docker buildx build --platform linux/arm64 -t xylifyx/buildx . >build.log

build: build.log

push: build
	docker push xylifyx/buildx

run: build
	docker run xylifyx/buildx
