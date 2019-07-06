help: ## Display this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-17s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

prep: ## Prepare the environment
	./prep.sh

build-containers: ## Build all the necessary containers
	./run.sh build

create-pkg: ## Compile python and create package
	./run.sh run ${BUILD_NUMBER}

all: prep build-containers create-pkg ## Do all the things

.PHONY: all prep build-containers create-pkg
