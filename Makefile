## help {{{
.PHONY: list
# http://stackoverflow.com/a/26339924/2239985
list:
	@echo "This Makefile has the following targets:"
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | sed 's/^/    /'
## }}}

.PHONY: install
install:
	./install

.PHONY: update-repo-synced-to-other-systems
# Execute for other systems which use this configuration.
update-repo-synced-to-other-systems:
	git checkout -f
	git pull
	git config --file .gitconfig commit.gpgsign false
