## Profile for Microsoft Shell only. (Not Visual Studio or other M$ shell instances)
Set-StrictMode -Version latest
# $ErrorActionPreference = "Stop"

## Some script or module messes with the $PWD so we save it here and restore it later as a workaround.
$start_cwd = $PWD

## It is called M$ Shell!
$host.ui.RawUI.WindowTitle = "M$ Shell"

## Set terminal encoding to a sensible one so that `git diff` works correctly.
$env:LC_ALL = 'C.UTF-8'

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
Import-Module ZLocation

## Get-Date -Format "o"
Function prompt { "M`$S $(Get-Date -format 'yyyy-MM-dd HH:mm:sszzz') $($env:UserName.ToLower())@$($env:ComputerName.ToLower()) $(Get-CleanPath $(pwd)) $(&{If(id) {'#'} Else {'$'}}) " }

Set-Location $(Split-Path -parent $profile)
@("custom_PSReadLine", "exports", "shell_public", "shell_private", "shell_extend_PATH") | ? { Test-Path -PathType Leaf "$_.ps1" } | % { Invoke-Expression ". ./$_.ps1" }

## PSReadLine seems to have issues with this:
## "An exception occurred in custom key handler, see $error for more information: Index was outside the bounds of the array."
Set-StrictMode -Off

cd "$start_cwd"
unset "start_cwd"

## Move M$ stuff out of the screen.
clear

echo 'M$ Shell'
echo 'Copyright (C) 1984 $$ Corporation. All rights granted.'
echo ''
