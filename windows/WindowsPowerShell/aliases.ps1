# Make Windows behave like a proper GNU/Linux. We are so mean :)
Set-Alias alias Set-Alias

# Easier Navigation: .., ..., ...., ....., and ~
${function:~} = { Set-Location ~ }
# PoSh won't allow ${function:..} because of an invalid path error, so...
${function:Set-ParentLocation} = { Set-Location .. }; alias ".." Set-ParentLocation
${function:...} = { Set-Location ..\.. }
${function:....} = { Set-Location ..\..\.. }
${function:.....} = { Set-Location ..\..\..\.. }
${function:......} = { Set-Location ..\..\..\..\.. }
${function:unalias} = { Remove-Item alias:$args }

# unalias cd
remove-item alias:cd
function cd {
    if ($args.count -eq 0) {
        $pwd='~';
    } elseif ($args[0] -eq '-') {
        $pwd=$OLDPWD;
    } else {
        $pwd=$args[0];
    }
    
    $tmp=pwd;
    
    if ($pwd) {
        Set-Location $pwd;
    }
    
    Set-Variable -Name OLDPWD -Value $tmp -Scope global;
}


# Missing GNU/Linux basics
alias time Measure-Command
function md5sum { $(CertUtil -hashfile $args MD5)[1] -replace " ",""; echo "Don't use MD5 anymore ;-)" }
function sha1sum { $(CertUtil -hashfile $args SHA1)[1] -replace " ",""; echo "Don't use SHA1 anymore ;-)" }
function sha256sum { $(CertUtil -hashfile $args SHA256)[1] -replace " ","" }
function sha512sum { $(CertUtil -hashfile $args SHA512)[1] -replace " ","" }
function dirname { (get-item $args).parent.fullname }
function basename { (get-item $args).basename.fullname }
alias hd Format-Hex
alias hexdump Format-Hex
alias xclip Out-Clipboard
alias grep ag
function df { get-driveinfo }

# Correct PowerShell Aliases if tools are available (aliases win if set)
# WGet: Use `ls.exe` if available
if (Get-Command wget.exe -ErrorAction SilentlyContinue | Test-Path) {
  rm alias:wget -ErrorAction SilentlyContinue
}

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
} else {
    # List all files, including hidden files
    ${function:la} = { ls -Force @args }
    # List only directories
    ${function:lsd} = { Get-ChildItem -Directory -Force @args }
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

# Create a new directory and enter it
alias mkd CreateAndSet-Directory

# Determine size of a file or total size of a directory
alias fs Get-DiskUsage

# Empty the Recycle Bin on all drives
alias emptytrash Empty-RecycleBin

# Cleanup old files all drives
alias cleandisks Clean-Disks

# Reload the shell
alias reload Reload-Powershell
alias reset Reload-Powershell
alias src Reload-Powershell

function id { ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator") }

# http://xkcd.com/530/
alias mute Set-SoundMute
alias unmute Set-SoundUnmute

# Update installed Ruby Gems, NPM, and their installed packages.
alias update System-Update


# Set GVim as default vim
alias vim gvim
alias vi gvim

alias editor 'gvim'
alias e 'editor'

alias d 'docker'
alias ack 'ag'
alias s 'ssh'
${function:ssh-keygen-sec} = { ssh-keygen -o -b 8192 -a 200 -t rsa $args }

## Can not be unaliased as it seems. Bad.
# unalias md
# ${function:md} = { mkdir -f $args >$null; cd $args }

alias v vagrant
alias g git
alias a 'git-annex'
function ga { git add $args }
# function gc  { git commit --verbose $args }
function gca { git commit --all }
function gst { git status $args }
function glg { git log --stat --show-signature $args }
function gpa { git pa $args }
function wd { git diff --color-words --no-index $args }
function gco { git checkout $args }
function gb { git branch $args }

# Just use regular git log on Windows
alias tig glg



# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

## Stuff for programs which should be available everywhere {{{

## https://superuser.com/questions/479600/how-can-i-prevent-tmux-exiting-with-ctrl-d
# export IGNOREEOF=2
## Does not work with zsh


alias ll 'ls'

# alias bc 'bc -q'
# Special charters as commands are not allowed.
# alias ',' 'popd'
# ${function:,} = { popd }

## https://tools.ietf.org/html/rfc3339
${function:ts} = { date -format u }

## Ignore typos {{{
alias 6s 'ls'
# alias sl 'ls'
alias fgfg 'fg'
## }}}

## }}}

## Vim stuff {{{

# alias ',e' 'exit'
${function:x} = { exit }
# alias ',x' 'exit'
# alias ',r' 'vi'
# alias less 'vim -c "w! /tmp/.vimpager" -'
## }}}

## Use as needed. --show-nonprinting does also output Unicode glyphs in escaped form.
# alias cat 'cat --show-nonprinting'

alias t 'task'
# alias f 'tmux last-window' ## Use prefix + Ctrl+S because it will also work in Vim or if another program is running in foreground.
# alias h 'htop'
${function:con} = { ping heise.de $args }

function n() {
    git log --reverse --pretty %H master | grep -A 1 "$(git rev-parse HEAD)" | tail -n1 | xargs git checkout
}
function p() {
    git checkout HEAD^1
}
