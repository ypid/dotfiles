SHELL := /bin/bash -o nounset -o pipefail -o errexit

ifeq ($(OS),Windows_NT)
DOUBLECMD_CONF_DIR ?= $(APPDATA)/doublecmd
# Rename xml to xmlstarlet on Windows system wide.
# XMLSTARLET ?= xml
get-changes: doublecmd-windows.xml
else
DOUBLECMD_CONF_DIR ?= $(HOME)/.config/doublecmd
get-changes: doublecmd.xml
endif

XMLSTARLET ?= xmlstarlet

doublecmd-windows-gen.xml: doublecmd.xml
	git add "$@"
	git show ":$(shell git rev-parse --show-prefix)$<" > "$@"
	$(XMLSTARLET) ed \
		--inplace \
		--omit-decl \
		--update '//doublecmd/Tools/Editor/Path' --value 'C:/tools/neovim/Neovim/bin/nvim-qt.exe' \
		--update '//doublecmd/Behaviours/RunInTerminalStayOpenCmd' --value 'ConEmu64.exe' \
		--update '//doublecmd/Behaviours/JustRunTerminal' --value 'ConEmu64.exe' \
		"$@"
	git reset HEAD -- "$<"


doublecmd-windows.xml: $(DOUBLECMD_CONF_DIR)/doublecmd.xml
	cp "$<" "$@"

doublecmd.xml: $(DOUBLECMD_CONF_DIR)/doublecmd.xml
	cp "$<" "$@"
