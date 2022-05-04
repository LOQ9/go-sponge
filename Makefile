PACKAGE_NAME = go-sponge
BIN_DIR=bin

export GO111MODULE=on
export CGO_ENABLED=0
export PATH:=$(PWD)/$(BIN_DIR):$(PATH)

# Strip debug info
LDFLAGS += "-s -w"

build: ## Builds the current project
	go build -o $(PWD)/$(BIN_DIR)/$(PACKAGE_NAME) main.go

deps: ## Downloads dependencies.
	go mod download

fmt: ## Formats code.
	go fmt ./...

build-mac: ## Build for Mac.
	mkdir -p bin/mac
	env GOOS=darwin GOARCH=amd64 go build -ldflags $(LDFLAGS) -o $(PWD)/$(BIN_DIR)/mac/$(PACKAGE_NAME) main.go

build-linux: ## Build for Linux.
	mkdir -p bin/linux
	env GOOS=linux GOARCH=amd64 go build -ldflags $(LDFLAGS) -o $(PWD)/$(BIN_DIR)/win/$(PACKAGE_NAME) main.go

build-win: ## Build for Windows.
	env GOOS=windows GOARCH=amd64 go build -ldflags $(LDFLAGS) -o $(PWD)/$(BIN_DIR)/win/$(PACKAGE_NAME).exe main.go

clean: ## Clean build artifacts.
	rm -rf bin

## Help documentatin à la https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' ./Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'