# Make Windows behave like a proper GNU/Linux. We are so mean :)

## Setup basic compatibility layer {{{
Set-Alias alias Set-Alias
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
    rm alias:ls -ErrorAction SilentlyContinue
    # Set `ls` to call `ls.exe` and always use --color
    ${function:ls} = { ls.exe --color @args }
    # List all files in long format
    ${function:l} = { ls -lF @args }
    # List all files in long format, including hidden files
    ${function:la} = { ls -laF @args }
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

alias s ssh
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
# function gc  { git commit --verbose @args }
Function gca { git commit --all }
Function gb { git branch @args }

Function git-push() { git push @args }
Set-Alias -Name gp -Value git-push -Force -Option AllScope

Function git-pull() { git pull @args }
Set-Alias -Name gl -Value git-pull -Force -Option AllScope

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

## Just use regular git log on Windows.
alias tig glg

## }}}

## ag {{{

alias ack ag

# }}}

## Package management {{{

Function ai { choco install @args }
Function ap { choco uninstall @args }
Function as { choco search @args }
Function ash { choco info @args }
Function an { choco upgrade all }

# }}}

## More aliases {{{

alias d 'docker'
alias t 'task'
Function con { ping heise.de @args }
alias a 'git-annex'
alias v vagrant

alias bc 'bc -q'

# Special charters as commands are not allowed.
# alias ',' 'popd'
# ${function:,} = { popd }

Function hd { hexdump -C @args }

## https://tools.ietf.org/html/rfc3339
${function:ts} = { date -format u }

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
Set-Alias -Name cd -Value Set-LocationUnix -Option AllScope -Force
alias time Measure-Command
Function md5sum([string]$algo)    { $(CertUtil -hashfile $algo MD5)[1] -replace " ",""; echo "Don't use MD5 anymore ;-)" }
Function sha1sum([string]$algo)   { $(CertUtil -hashfile $algo SHA1)[1] -replace " ",""; echo "Don't use SHA1 anymore ;-)" }
Function sha256sum([string]$algo) { $(CertUtil -hashfile $algo SHA256)[1] -replace " ","" }
Function sha512sum([string]$algo) { $(CertUtil -hashfile $algo SHA512)[1] -replace " ","" }
alias xclip Out-Clipboard
alias which get-command
alias ip ipconfig
alias ll ls
alias reset Restart-Powershell
alias top taskmgr
alias htop procexp

if (Test-Path "C:\GnuWin\bin\tree.exe") {
    alias tree "C:\GnuWin\bin\tree.exe"
}

Function id {
	return ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
}

## Overwrite MS Shell aliases so that GnuWin commands are used {{{

# Correct PowerShell Aliases if tools are available (aliases win if set)
# WGet: Use `ls.exe` if available
if (Get-Command wget.exe -ErrorAction SilentlyContinue | Test-Path) {
  rm alias:wget -ErrorAction SilentlyContinue
}

# curl: Use `curl.exe` if available
if (Get-Command curl.exe -ErrorAction SilentlyContinue | Test-Path) {
    rm alias:curl -ErrorAction SilentlyContinue
    # Set `ls` to call `ls.exe` and always use --color
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

# Basic commands
Function touch($file) { "" | Out-File $file -Encoding ASCII }


# Common Editing needs
function Edit-Hosts { Invoke-Expression "sudo $(if($env:EDITOR -ne $null)  {$env:EDITOR } else { 'notepad' }) $env:windir/system32/drivers/etc/hosts" }
function Edit-Profile { Invoke-Expression "$(if($env:EDITOR -ne $null)  {$env:EDITOR } else { 'notepad' }) $profile" }
