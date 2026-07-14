# Convenience wrapper: forwards any target to a lab directory.
#   make plan LAB=labs/02-remote-state
# The usual way to work is simply to cd into a lab and run make there.
LAB ?= labs/01-installing-terraform

.DEFAULT_GOAL := help

%:
	@$(MAKE) --no-print-directory -C $(LAB) $@
