# It is called M$ Shell!
$host.ui.RawUI.WindowTitle = "M$ Shell"

Import-Module ypidDotfiles

# Go with one namespace for now in the hope that when Functions get pushed
# upstream I will notice and can remove them from ypidDotfiles.
#
# Import-Module ypidDotfiles -Prefix ypid -Verbose

# Get-Date -Format "o"
Function prompt { "M`$S $(Get-Date -format 'yyyy-MM-dd HH:mm:sszzz') $($env:UserName.ToLower())@$($env:ComputerName.ToLower()) $(Get-CleanPath $(pwd)) $(&{If(id) {'#'} Else {'$'}}) " }

Set-Location $(Split-Path -parent $profile)
@("custom_PSReadLine", "exports", "shell_extend_PATH", "shell_public", "shell_private", "forward_slash_hack") | ? { Test-Path -PathType Leaf "$_.ps1" } | % { Invoke-Expression ". ./$_.ps1" }

# https://superuser.com/questions/1113429/disable-powershell-beep-on-backspace
Set-PSReadlineOption -BellStyle None

If ((Get-CleanPath($PWD)).ToString().EndsWith("/Documents/PowerShell")) {
    cd ~/.config/dotfiles/
}

# Move M$ stuff out of the screen.
clear

echo 'M$ Shell'
echo 'Copyright (C) 1984 $$ Corporation. All rights granted.'
echo ''
