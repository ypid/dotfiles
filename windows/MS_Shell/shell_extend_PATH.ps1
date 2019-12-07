Add-PathAtBegin "c:/GnuWin/bin"
Add-PathAtBegin "c:/program files/openssl/bin"
Add-PathAtBegin "c:/programdata/chocolatey/bin"
Add-PathAtBegin "c:/programdata/chocolatey/lib/sysinternals/tools"

# Not needed. Installer adds this by default.
# Get-ChildItem -Path c:/ 'Python3*' | %{ Add-PathAtBegin "C:/$($_.name)" }

Add-PathAtEnd 'c:/Program Files (x86)/PDFtk/bin'

Get-ChildItem -Directory "C:/ProgramData/Chocolatey/lib" | Where-Object {$_.Name -match "^wsl-"} | ForEach-Object { Add-PathAtEnd "$($_.FullName)/tools/unzipped" }
# Get-ChildItem -Directory "c:/var/lib/wsl/" | ForEach-Object { Add-PathAtEnd "$($_.FullName)" }

Add-PathAtEnd "$env:USERPROFILE/Documents/portable/kitty"
Add-PathAtEnd "$env:USERPROFILE/AppData/Local/autojump/bin"
Add-PathAtEnd "$env:USERPROFILE/AppData/Roaming/Python/Scripts"
Add-PathAtEnd "$env:USERPROFILE/AppData/Local/Pandoc"
