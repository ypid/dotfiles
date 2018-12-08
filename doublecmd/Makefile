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

doublecmd.xml: ~/.config/doublecmd/doublecmd.xml
	./sanitize_doublecmd_xml --input-file "$<" --output-file "$@" --verbose

%: ~/.config/doublecmd/%
	cp "$<" "$@"
