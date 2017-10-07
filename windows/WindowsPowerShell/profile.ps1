# Profile for Microsoft Shell only. (Not Visual Studio or other M$ shell instances)
Set-StrictMode -Version latest
# $ErrorActionPreference = "Stop"

# Set terminal encoding to a sensible one so that `git diff` works correctly.
$env:LC_ALL='C.UTF-8'

Import-Module ypidDotfiles

## Go with one namespace for now in the hope that when Functions get pushed
## upstream I will notice and can remove them from ypidDotfiles.
# Import-Module ypidDotfiles -Prefix ypid -Verbose

try {
  Import-Module pscx
} catch {
  write-warning "Install pscx, it comes in handy :)"
}

Import-Module PSReadLine


Set-Location $(Split-Path -parent $profile)
@("custom_PSReadLine", "functions", "exports", "shell_public", "shell_private") | ? { Test-Path -PathType Leaf "$_.ps1" } | % { Invoke-Expression ". ./$_.ps1" }

## PSReadLine seems to have issues with this:
## "An exception occurred in custom key handler, see $error for more information: Index was outside the bounds of the array."
Set-StrictMode -Off

if (test-path "~/Documents/dotfiles/dotfiles-ypid/") {
    cd "~/Documents/dotfiles/dotfiles-ypid/"
}

## Move M$ stuff out of the screen. Disabled because bad for debugging.
# clear
