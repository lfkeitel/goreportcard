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
