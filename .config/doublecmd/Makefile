SHELL := /bin/bash -o nounset -o pipefail -o errexit

ifeq ($(OS),Windows_NT)
DOUBLECMD_CONF_DIR ?= $(APPDATA)/doublecmd
else
DOUBLECMD_CONF_DIR ?= $(HOME)/.config/doublecmd
endif

all: install

install-force:
	rm -rf "$(DOUBLECMD_CONF_DIR)/doublecmd.xml" "$(DOUBLECMD_CONF_DIR)/shortcuts.scf"
	$(MAKE) install

install:
	mkdir --parents "$(DOUBLECMD_CONF_DIR)"
	test -e "$(DOUBLECMD_CONF_DIR)/doublecmd.xml" || cp doublecmd.xml "$(DOUBLECMD_CONF_DIR)/doublecmd.xml"
	# Doublecmd as of 0.8.4 can not handle symlinks (GNU/Linux and Windows).
	test -e "$(DOUBLECMD_CONF_DIR)/shortcuts.scf" || cp shortcuts.scf "$(DOUBLECMD_CONF_DIR)/shortcuts.scf"
ifeq ($(OS),Windows_NT)
	# Workaround see ../install.ps1
	# Not using the Makefile on Windows for install because make might not be installed.
endif

get-changes: shortcuts.scf doublecmd.xml doublecmd-windows.xml

doublecmd-windows.xml: doublecmd.xml Makefile
	git add "$<"
	git show ":$(shell git rev-parse --show-prefix)doublecmd.xml" > "$@"
	xmlstarlet ed \
		--inplace \
		--omit-decl \
		--update '//doublecmd/Tools/Editor/Path' --value 'C:/Program Files/Vim/vim81/gvim.exe' \
		--update '//doublecmd/Behaviours/RunInTerminalStayOpenCmd' --value 'ConEmu64.exe' \
		--update '//doublecmd/Behaviours/JustRunTerminal' --value 'ConEmu64.exe' \
		"$@"
	git reset HEAD -- "$<"


%: $(DOUBLECMD_CONF_DIR)/%
	cp "$<" "$@"
