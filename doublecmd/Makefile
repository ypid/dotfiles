all: install

install:
	test -e ~/.config/doublecmd/doublecmd.xml || cp doublecmd.xml ~/.config/doublecmd/doublecmd.xml
	test -e ~/.config/doublecmd/shortcuts.scf || cp shortcuts.scf ~/.config/doublecmd/shortcuts.scf

get-changes: shortcuts.scf doublecmd.xml

doublecmd.xml: ~/.config/doublecmd/doublecmd.xml
	./sanitize_doublecmd_xml --input-file "$<" --output-file "$@" --verbose

%: ~/.config/doublecmd/%
	cp "$<" "$@"
