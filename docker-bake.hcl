group "default" {
  targets = ["buildx"]
}

target "buildx" {
  dockerfile = "Dockerfile"
  tags = ["docker.io/xylifyx/buildx"]
  platforms = ["linux/amd64", "linux/arm64"]
  args = {
    MSG = "Hello from a bake build"
  }
}
