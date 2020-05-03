ifeq ($(OS),Windows_NT)
DOUBLECMD_CONF_DIR ?= $(APPDATA)/doublecmd
else
DOUBLECMD_CONF_DIR ?= ~/.config/doublecmd
endif

all: install

install:
	mkdir --parents ~/.config/doublecmd
	test -e ~/.config/doublecmd/doublecmd.xml || cp doublecmd.xml ~/.config/doublecmd/doublecmd.xml
	## Doublecmd as of 0.8.4 can not handle symlinks (GNU/Linux and Windows).
	test -e ~/.config/doublecmd/shortcuts.scf || cp shortcuts.scf ~/.config/doublecmd/shortcuts.scf
ifeq ($(OS),Windows_NT)
	# Workaround see ../install.ps1
endif

get-changes: shortcuts.scf doublecmd.xml

## M$ Windows does not support /usr/bin/env to find python3. Call manually.
doublecmd.xml: $(DOUBLECMD_CONF_DIR)/doublecmd.xml
	./sanitize_doublecmd_xml --input-file "$<" --output-file "$@" --verbose

%: $(DOUBLECMD_CONF_DIR)/%
	cp "$<" "$@"
