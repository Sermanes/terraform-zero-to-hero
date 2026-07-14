# Shared Terraform targets. Each lab includes this file from its own Makefile:
#   include ../../terraform.mk
TF_VERSION ?= 1.15
TF_IMAGE   := hashicorp/terraform:$(TF_VERSION)
TF_RUN     := docker run --rm -it \
	-v "$(CURDIR)":/workspace -w /workspace \
	-v "$(HOME)/.config/gcloud":/root/.config/gcloud:ro \
	$(TF_IMAGE)

.PHONY: init plan apply destroy fmt validate version help

init: ## Download providers and prepare the directory
	$(TF_RUN) init

plan: ## Show what would change, without touching anything
	$(TF_RUN) plan

apply: ## Apply the changes (asks for confirmation)
	$(TF_RUN) apply

destroy: ## Destroy everything declared (asks for confirmation)
	$(TF_RUN) destroy

fmt: ## Format the .tf files
	$(TF_RUN) fmt -recursive

validate: ## Check that the configuration is valid
	$(TF_RUN) validate

version: ## Terraform version inside the container
	$(TF_RUN) version

help: ## Show this help
	@grep -hE '^[a-zA-Z_-]+:.*## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*## "} {printf "%-10s %s\n", $$1, $$2}'
