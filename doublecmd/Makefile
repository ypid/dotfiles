all: install

install:
	mkdir --parents ~/.config/doublecmd
	test -e ~/.config/doublecmd/doublecmd.xml || cp doublecmd.xml ~/.config/doublecmd/doublecmd.xml
	test -e ~/.config/doublecmd/shortcuts.scf || cp shortcuts.scf ~/.config/doublecmd/shortcuts.scf
ifeq ($(OS),Windows_NT)
	sed --in-place --regexp-extended 's/Ctrl\+Shift\+7/Ctrl+Shift+8/;s#Ctrl\+Num/#Ctrl+Shift+7#;' ~/.config/doublecmd/shortcuts.scf
endif

get-changes: shortcuts.scf doublecmd.xml

doublecmd.xml: ~/.config/doublecmd/doublecmd.xml
	./sanitize_doublecmd_xml --input-file "$<" --output-file "$@" --verbose

%: ~/.config/doublecmd/%
	cp "$<" "$@"
