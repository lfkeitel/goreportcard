DOCKER_DIR := /go/src/github.com/lfkeitel/goreportcard
DOCKER_PWD := $(PWD)
ifeq ($(shell uname -o), Cygwin)
DOCKER_PWD := //c/cygwin64$(PWD)
endif

all: lint build test

build:
	go build -o goreportcard main.go

install-deps:
	go get github.com/alecthomas/gometalinter
	gometalinter --install --update

install:
	go install main.go

lint:
	gometalinter --exclude=vendor --exclude=repos --disable-all --enable=golint --enable=vet --enable=gofmt ./...
	find . -name '*.go' | xargs gofmt -w -s

test:
	 go test -cover ./check ./handlers

start:
	 go run main.go

start-dev:
	 go run main.go -dev

misspell:
	find . -name '*.go' -not -path './vendor/*' | xargs misspell -error

docker:
	mkdir -p build-tmp
	docker run --rm \
		-v $(DOCKER_PWD):$(DOCKER_DIR) \
		-w $(DOCKER_DIR) \
		-e CGO_ENABLED=0 \
		golang:1.8 /bin/bash -c 'make install-deps; make build; go get github.com/golang/go/src/cmd/gofmt; go get github.com/golang/go/src/cmd/vet; cp $$GOPATH/bin/* ./build-tmp'
	docker build -t goreportcard .
