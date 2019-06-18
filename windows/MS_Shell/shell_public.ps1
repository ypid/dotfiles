# Make Windows behave like a proper GNU/Linux. We are so mean :)

## Setup basic compatibility layer {{{
Set-Alias alias Set-Alias
Set-Alias unset Remove-Variable 
Set-Alias unalias Remove-Alias
Set-Alias pathprepend Add-PathAtBegin
Set-Alias pathappend Add-PathAtEnd
## }}}

## Exports {{{

Set-Environment "EDITOR" "gvim --nofork"
Set-Environment "GIT_EDITOR" $Env:EDITOR

## }}}

## Enable color support of ls and also add handy aliases {{{

# Directory Listing: Use `ls.exe` if available
if (Get-Command ls.exe -ErrorAction SilentlyContinue | Test-Path) {
    Remove-Item alias:ls -ErrorAction SilentlyContinue
    # Set `ls` to call `ls.exe` and always use --color
    ${function:ls} = { ls.exe --color @args }
    # List all files in long format.
    ${function:l} = { ls -lF @args }
    # List all files in long format, including hidden files.
    ${function:ll} = { ls -lF --all @args }
    # List all files in long format, including hidden files.
    ${function:la} = { ls -lF --almost-all @args }
    # List only directories
    ${function:lsd} = { Get-ChildItem -Directory -Force @args }

    ${function:grep} = { grep.exe --color=auto @args }
    ${function:fgrep} = { fgrep.exe --color=auto @args }
    ${function:egrep} = { egrep.exe --color=auto @args }
} else {
    # List all files, including hidden files
    ${function:la} = { ls -Force @args }
    # List only directories
    ${function:lsd} = { Get-ChildItem -Directory -Force @args }
}

## }}}

## Little functions {{{

alias up Set-LocationUp
Set-Alias -Name md -Value Set-LocationMkDir -Option AllScope

## }}}

## Editor {{{

# Function editor { Invoke-Expression $env:EDITOR $args }
alias editor gvim
alias e editor

## Overwrite command-line Vim commands.
alias vim editor
alias vi editor

# alias ',e' 'exit'
${function:x} = { exit }
# alias ',x' 'exit'
# alias ',r' 'vi'
# alias less 'vim -c "w! /tmp/.vimpager" -'

## }}}

## SSH {{{

## Kitty is preferred as SSH client on M$.
# alias s ssh
alias s Enter-PSSession
${function:ssh-keygen-sec} = { ssh-keygen -o -b 8192 -a 200 -t rsa }

## }}}

## Git {{{

## Able to push to all git remotes with the one command?
## http://stackoverflow.com/a/18674313
Function gpa { git pa @args }

## Use the shortcuts from oh-my-zsh for git
Function wd { git diff --color-words --no-index @args }

# Define important shortcuts here if under bash (are already defended by oh-my-zsh) {{{
alias g git

Function ga { git add @args }
Function gst { git status @args }
Function gco { git checkout @args }
Function gca { git commit --all }
Function gb { git branch @args }

Function git-commit() { git commit --verbose @args }
Set-Alias -Name gc -Value git-commit -Force -Option AllScope

Function git-push() { git push @args }
Set-Alias -Name gp -Value git-push -Force -Option AllScope

Function git-pull() { git pull @args }
Set-Alias -Name gl -Value git-pull -Force -Option AllScope

Function git-merge() { git merge @args }
Set-Alias -Name gm -Value git-merge -Force -Option AllScope

Function n {
    git log --reverse --pretty=%H master | grep -A 1 "$(git rev-parse HEAD)" | tail -n1 | xargs git checkout
}
function p() {
    git checkout HEAD^1
}
## }}}

# overwrite alias from oh-my-zsh {{{
Function glg { git log --stat --show-signature @args }

## }}}

if (!(Get-Command tig.exe -ErrorAction SilentlyContinue | Test-Path)) {
    alias tig glg
}

## }}}

## ag {{{

alias ack ag

# }}}

## Machine-wide package management: Platform dependent {{{

alias m 'choco'
Function ai { choco install @args }
Function ap { choco uninstall @args }
Function as { choco search @args }
Function ash { choco info @args }
Function an {
    if ($args.Count -eq 0) {
        choco upgrade all @args
    } else {
        choco upgrade @args
    }
}

# }}}

## More aliases {{{

alias d 'docker'
alias t 'task'
Function con { ping heise.de @args }
Function conn { ping -6 heise.de @args }
Function conl { ping -4 heise.de @args }
alias a 'git-annex'
alias v vagrant

alias bc 'bc -q'

# Special charters as commands are not allowed.
# alias ',' 'popd'
# ${function:,} = { popd }

Function hd { hexdump -C @args }

## https://tools.ietf.org/html/rfc3339
${function:ts} = { date -format u }

alias python3 python
Get-ChildItem "c:/" -Filter 'python*' | ForEach-Object{ $_.FullName } | Sort-Object | Select-Object -first 1 | %{
    alias python2 (Join-Path -Path $_ -ChildPath "python.exe")
}

if (Test-Path 'C:/Program Files/DB Browser for SQLite/DB Browser for SQLite.exe') {
    alias sqlitebrowser 'C:/Program Files/DB Browser for SQLite/DB Browser for SQLite.exe'
}

alias nslookup 'C:/Windows/system32/nslookup.exe'

alias j Set-ZLocation

## }}}

## oh-my-zsh on Windows {{{

# Easier Navigation: .., ..., ...., ....., and ~
${function:~} = { Set-Location ~ }

# PoSh won't allow ${function:..} because of an invalid path error, so...
${function:Set-ParentLocation} = { Set-Location .. }
alias ".." Set-ParentLocation

${function:...} = { Set-Location ../.. }
${function:....} = { Set-Location ../../.. }
${function:.....} = { Set-Location ../../../.. }
${function:......} = { Set-Location ../../../../.. }

## }}}

## GNU/Linux basics on Windows {{{
Function poweroff() { shutdown -t 0 -s }
Function reboot() { shutdown -t 0 -r }
Set-Alias -Name uptime -Value Get-Uptime
Set-Alias -Name cd -Value Set-LocationUnix -Option AllScope -Force
alias time Measure-Command
Function md5sum([string]$algo)    { $(CertUtil -hashfile $algo MD5)[1] -replace " ",""; echo "Don't use MD5 anymore ;-)" }
Function sha1sum([string]$algo)   { $(CertUtil -hashfile $algo SHA1)[1] -replace " ",""; echo "Don't use SHA1 anymore ;-)" }
Function sha256sum([string]$algo) { $(CertUtil -hashfile $algo SHA256)[1] -replace " ","" }
Function sha512sum([string]$algo) { $(CertUtil -hashfile $algo SHA512)[1] -replace " ","" }
Function which() { Get-Command @args | Format-Table Path, Name }
Function whichw() { (Get-Command @args).Definition }

Function ping { ping.exe -t @args }

## Gets aliased by pscx but we prefer the original GNU coreutils version
unalias touch

alias xclip Out-Clipboard
alias ip ipconfig
alias reset Restart-Powershell
alias top taskmgr
alias htop procexp
alias nautilus explorer.exe
alias nemo explorer.exe
alias xdg-open start

if (Test-Path "C:/GnuWin/bin") {
    alias tree "tree.exe"
    alias find "C:/GnuWin/bin/find.exe"
    Set-Alias -Name cp -Value "cp.exe" -Option AllScope
    Set-Alias -Name mv -Value "mv.exe" -Option AllScope
    Set-Alias -Name rm -Value "rm.exe" -Option AllScope
    Remove-Item alias:diff -Force
    Set-Alias -Name diff -Value "diff.exe"
}

Function id {
	return ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
}

## More similar to `journalctl --list-boots` and  `last reboot`.
Function last-startup {
        get-eventlog system | where-object {$_.eventid -eq 6005} | select Timegenerated, EntryType, Source, Message -first 10
}

Function last-shutdown {
        get-eventlog system | where-object {$_.eventid -eq 6006} | select Timegenerated, EntryType, Source, Message -first 10
}

## Overwrite MS Shell aliases so that GnuWin commands are used {{{

# Correct PowerShell Aliases if tools are available (aliases win if set)
# WGet: Use `wget.exe` if available
if (Get-Command wget.exe -ErrorAction SilentlyContinue | Test-Path) {
  Remove-Item alias:wget -ErrorAction SilentlyContinue
}

# curl: Use `curl.exe` if available
if (Get-Command curl.exe -ErrorAction SilentlyContinue | Test-Path) {
    Remove-Item alias:curl -ErrorAction SilentlyContinue
    ${function:curl} = { curl.exe @args }
    # Gzip-enabled `curl`
    ${function:gurl} = { curl --compressed @args }
} else {
    # Gzip-enabled `curl`
    ${function:gurl} = { curl -TransferEncoding GZip }
}

## }}}

## Also provided by GnuWin {{{
Function df { get-driveinfo @args }
Function dirname([string]$Item) { (get-item $Item).parent.fullname }
Function basename([string]$Item) { (get-item $Item).basename.fullname }

## }}}

## }}}

## Aliases which are scripts under GNU/Linux {{{

Set-Alias -Name h -Value Get-HistorySearch -Option AllScope

# }}}

## Ignore typos {{{
alias 6s 'ls'
# alias sl 'ls'
alias fgfg 'fg'
## }}}

# https://xkcd.com/530/
alias mute Set-SoundMute
alias unmute Set-SoundUnmute

# Update installed Ruby Gems, NPM, and their installed packages.
alias update Get-SystemUpdate

# Common Editing needs
function Edit-Hosts { Invoke-Expression "sudo $(if($env:EDITOR -ne $null)  {$env:EDITOR } else { 'notepad' }) $env:windir/system32/drivers/etc/hosts" }
function Edit-Profile { Invoke-Expression "$(if($env:EDITOR -ne $null)  {$env:EDITOR } else { 'notepad' }) $profile" }
