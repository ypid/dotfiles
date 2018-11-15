pathprepend "c:/GnuWin/bin"
pathprepend "c:/program files/openssl/bin"
pathprepend "c:/programdata/chocolatey/bin"

# Not needed. Installer adds this by default.
# Get-ChildItem -Path c:/ 'Python3*' | %{ pathprepend "C:/$($_.name)" }

pathappend 'c:/Program Files (x86)/PDFtk/bin'
pathappend "$env:USERPROFILE/Documents/portable/kitty"
pathappend "$env:USERPROFILE/AppData/Local/autojump/bin"
pathappend "$env:USERPROFILE/AppData/Roaming/Python/Scripts"
pathappend "$env:USERPROFILE/AppData/Local/Pandoc"
