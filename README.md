[![Go Report Card](https://goreportcard.com/badge/lfkeitel/goreportcard)](https://goreportcard.com/report/lfkeitel/goreportcard) [![Build Status](https://travis-ci.org/lfkeitel/goreportcard.svg?branch=master)](https://travis-ci.org/lfkeitel/goreportcard)

# Go Report Card

A web application that generates a report on the quality of an open source go project. It uses several measures, including `gofmt`, `go vet`, `go lint` and `gocyclo`.

This repository is a **fork** of the code running at [goreportcard.com](https://goreportcard.com).

### Installation

Assuming you already have a recent version of Go installed, pull down the code with `go get`:

```
go get github.com/lfkeitel/goreportcard
```

Go into the source directory and pull down the project dependencies:

```
cd $GOPATH/src/github.com/lfkeitel/goreportcard
make install-deps
```

Now run

```
make start-dev
```

and you should see

```
Running on 127.0.0.1:8000...
```

Navigate to that URL in your browser and check that you can see the front page.

When running the site in a production environment, instead of `make start-dev`, run:

```
make start
```

### Command Line Options

- **-dev**: Run in dev mode.
- **-addr**: Network address to bind to, defaults to ":8000".
- **-branch**: Branch to checkout. Defaults to "" which is the default branch.

### Contributing

Go Report Card is an open source project run by volunteers, and contributions are welcome! Check out the [Issues](https://github.com/lfkeitel/goreportcard/issues) page to see if your idea for a contribution has already been mentioned, and feel free to raise an issue or submit a pull request.

### License

The code is licensed under the permissive Apache v2.0 licence. This means you can do what you like with the software, as long as you include the required notices. [Read this](https://tldrlegal.com/license/apache-license-2.0-(apache-2.0)) for a summary.
