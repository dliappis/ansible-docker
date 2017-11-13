#### Building

Requires https://github.com/go-task/task

1. Ensure the `task` binary is present:
  either: `go get -u -v github.com/go-task/task/cmd/task`
  or build one via docker:
  `mkdir bin`
  `docker run --rm -v $PWD/bin:/go/bin golang go get -u -v github.com/go-task/task/cmd/task`

2. `task build-ansible-docker`
