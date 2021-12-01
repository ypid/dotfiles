# vim: foldmarker={{{,}}}:foldmethod=marker

## Switch to bash inside template qubes on Qubes OS to reduce attack surface.
if [ -e "/run/qubes/this-is-templatevm" ]; then
    exec bash
fi

# Enable this:
# zmodload zsh/zprof
# And run `zprof` in a new shell to profile startup time.

# Basic paths {{{
ZSH="${XDG_CONFIG_HOME:-$HOME/.config}/oh-my-zsh"
# ZSH_CACHE_DIR="$ZSH/cache" might not be writable
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
mkdir -p "$ZSH_CACHE_DIR"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
# }}}

# Profile startup {{{
PROFILE_STARTUP=false
if [[ "$PROFILE_STARTUP" == true ]]; then
    # http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
    PS4=$'%D{%M%S%.} %N:%i> '
	mkdir -p "$HOME/tmp"
    exec 3>&2 2> "$HOME/tmp/startlog.$$"
    setopt xtrace prompt_subst
fi
# Entirety of my startup file... then
if [[ "$PROFILE_STARTUP" == true ]]; then
    unsetopt xtrace
    exec 2>&3 3>&-
fi
# }}}

# Themes {{{
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="random"

# ordered after preference.
# ZSH_THEME="bira"
# ZSH_THEME="cypher" # nice exit code
# ZSH_THEME="dieter" # also nice exit code
# ZSH_THEME="dallas"
# ZSH_THEME="blinks"
# ZSH_THEME="amuse"
# ZSH_THEME="cloud"
# ZSH_THEME="gianu"
# ZSH_THEME="geoffgarside"
# ZSH_THEME="kphoen"
# ZSH_THEME="jreese"
# ZSH_THEME="philips"
#
# I don‘t like them {{{
# ZSH_THEME="trapd00r"    # prompt_jnrowe_precmd:20: command not found: zsh_path
# ZSH_THEME="miloshadzic" # no full path
# ZSH_THEME="jnrowe"      # uses yellow
# ZSH_THEME="dogenpunk"   # too slow
# ZSH_THEME="frisk"       # $too slow
# ZSH_THEME="agnoster"    # Does not work for light background colors
# ZSH_THEME="jonathan"    # looks to crazy
# ZSH_THEME="josh"        # does not show git info on the left
# ZSH_THEME="fino" # Not so colorful, no return code
# ZSH_THEME="funky"
# ZSH_THEME="xiong-chiamiov-plus"
# ZSH_THEME="dpoggi"
# }}}
#
# Not enough infos shown (definitively need user@hostname, path, git status and exit code of last command) {{{
# ZSH_THEME="pygmalion"
# ZSH_THEME="fwalch"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="rixius"
# ZSH_THEME="fishy"
# ZSH_THEME="steeef"
# }}}
#
# }}}

# oh-my-zsh configuration {{{
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

ZSH_CUSTOM="${XDG_CONFIG_HOME:-$HOME/.config}/oh-my-zsh-custom"

HIST_STAMPS='yyyy-mm-dd'

ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump-${ZSH_VERSION}"
# }}}

# Plugins {{{
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#
# Mandatory
plugins=(autojump)
plugins+=(git-annex)
plugins+=(git)
plugins+=(pip)
# plugins=(tmuxinator)
# [[ -e ~/gems/gems/tmuxinator-0.6.8/completion/tmuxinator.zsh ]] && source ~/gems/gems/tmuxinator-0.6.8/completion/tmuxinator.zsh

# Nice to have

if [[ ! -a /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    plugins+=(zsh-syntax-highlighting)
fi

if [[ -d /usr/share/zsh/vendor-completions ]]; then
	fpath+="/usr/share/zsh/vendor-completions"
fi

# Additional functions
plugins+=(debian)
plugins+=(encode64)
plugins+=(urltools)
plugins+=(zsh_reload)
# plugins+=(zsh-compdef)
plugins+=(zsh-completions)
plugins+=(zsh-compdef-ypid-collected)

# Testing

## gr {{{
# plugins+=(vagrant)
# plugins+=(emoji)
# plugins+=(gr)
# . <(gr completion)
# Takes to long.
## }}}

# Not tested enough, might be useful
: <<'END'
plugins+=(vi-mode)
plugins+=(gitfast)
plugins+=(command-not-found)

plugins+=(git-flow)
# I only maintain small projects for which it is not worth the cost (yet?). Also a concern is that contributers might get confused and will not use the same development model.

END

# Not needed
: <<'END'
plugins+=(mosh)
plugins+=(lol)
plugins+=(per-directory-history)
plugins+=(rand-quote)
plugins+=(dircycle) ## Just use Neo2 :)
plugins+=(jsontools) ## json from npm
plugins+=(systemd)
plugins+=(colored-man)

END

# tested and decided not to use
: <<'END'
plugins+=(tmux) # Did not work
plugins+=(last-working-dir) # does break 'open in Terminal' of nautilus and nemo

END
# echo "Loaded plugins: $plugins"
#
# }}}

source "$ZSH/oh-my-zsh.sh"

autoload -U bashcompinit
bashcompinit

source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/global"

# Bug in oh-my-zsh. If a plugin changes fpath, it is not picked up by compinit because it is run first!1!?
# Hopefully this will be fixed by one of the refactoring pull requests.

# On slow systems, checking the cached .zcompdump file to see if it must be
# regenerated adds a noticable delay to zsh startup.  This little hack restricts
# it to once a day.  It should be pasted into your own completion file.
#
# The globbing is a little complicated here:
# - '#q' is an explicit glob qualifier that makes globbing work within zsh's [[ ]] construct.
# - 'N' makes the glob pattern evaluate to nothing when it doesn't match (rather than throw a globbing error)
# - '.' matches "regular files"
# - 'mh+24' matches files (or directories or whatever) that are older than 24 hours.
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
    if [[ $DOCKER_IGNORE_UNSECURE == 1 ]]
    then
        compinit -u
    else
        compinit
    fi
else
	compinit -C
fi

if command -v compdef >/dev/null 2>&1; then
    command -v ssh_wrapper >/dev/null 2>&1 && compdef ssh_wrapper=ssh
    command -v sshrc_wrapper >/dev/null 2>&1 && compdef sshrc_wrapper=ssh
    command -v sc >/dev/null 2>&1 && compdef sc=service
    command -v rl >/dev/null 2>&1 && command -v journalctll >/dev/null 2>&1 && compdef rl=journalctl
fi

if [[ -a /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [[ -a /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Own theme based on dieter and bira {{{

# local time, color coded by last return code
# time_enabled="%(?.⌚ %{$fg[green]%}.%{$fg[red]%})%*%{$reset_color%}"
time_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})%D{%Y-%m-%d %H:%M:%S%z}%{$reset_color%}"
time_disabled="%{$fg[green]%}%*%{$reset_color%}"
time="$time_enabled"

# user part, color coded by privileges
## In case of "Name or service not known" we fall back to $HOST.
HOSTNAME="$(hostname --fqdn 2> /dev/null || echo "$HOST")"
if [ "$HOSTNAME" = "localhost" ]; then
    HOSTNAME="$HOST"
fi

local user="%{$terminfo[bold]$fg[green]%}%n"
if [ "$USER" = "root" ]; then
    user="%{$terminfo[bold]$fg[red]%}%n"
fi

local host="%{$terminfo[bold]$fg[green]%}${HOSTNAME}"
test -f /etc/machine-info && source /etc/machine-info
if [ "$DEPLOYMENT" = "production" ]; then
    host="%{$terminfo[bold]$fg[red]%}${HOSTNAME}"
fi
local user_host='${user}%{$reset_color%}@${host}%{$reset_color%}'

local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'

local git_branch=''
if [ -z "$ANDROID_ROOT" ] && [ "$(hostname)" != "files" ]; then
    git_branch=' $(git_prompt_info)%{$reset_color%}'
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

# elaborate exitcode on the right when >0
return_code_enabled="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
return_code_disabled=
return_code=$return_code_enabled

# RPS1='${return_code}'

PROMPT="╭─ ${time} ${user_host}${current_dir}${git_branch} ${return_code}
╰─ %B%(!.#.$)%b "

function accept-line-or-clear-warning () {
	if [[ -z $BUFFER ]]; then
		time=$time_disabled
		return_code=$return_code_disabled
	else
		time=$time_enabled
		return_code=$return_code_enabled
	fi
	zle accept-line
}
zle -N accept-line-or-clear-warning
bindkey '^M' accept-line-or-clear-warning
# }}}

# like eternal history
# SAVEHIST=100000000
# huge performance killer!

# http://vim.1045645.n5.nabble.com/vim-ctrl-s-mapping-does-not-work-td1147525.html
stty -ixon -ixoff
# I use tmux copy mode for this anyway.

setopt no_share_history

## IGNORE_EOF like in bash http://www.zsh.org/mla/users/2001/msg00240.html {{{
# bash-ctrl-d() {
#   if [[ $CURSOR == 0 && -z $BUFFER ]]
#   then
#     [[ -z $IGNOREEOF || $IGNOREEOF == 0 ]] && exit
#     if [[ $LASTWIDGET == bash-ctrl-d ]]
#     then
#       (( --__BASH_IGNORE_EOF <= 0 )) && exit
#     else
#       (( __BASH_IGNORE_EOF = IGNOREEOF-1 ))
#     fi
#     zle send-break
#   else
#     zle delete-char-or-list
#   fi
# }

# zle -N bash-ctrl-d
# bindkey "^D" bash-ctrl-d
## }}}

## bindkey {{{
bindkey -v
bindkey -M vicmd v edit-command-line
bindkey '^R' history-incremental-search-backward
bindkey '^K' history-beginning-search-backward
bindkey '^O' history-beginning-search-forward
# bindkey '^M' history-beginning-search-forward # disables enter
bindkey '^P' up-history
bindkey '^N' down-history

[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" history-beginning-search-backward
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" history-beginning-search-forward
## }}}

# notifyosd.zsh {{{

LONG_RUNNING_IGNORE_LIST=(vim vi nvim nano htop top tmux less)

# Too many false positives because tabs in my Terminal emulator and Qubes OS
# windows are not yet supported.
# source ~/.config/dotfiles/submodules/notifyosd.zsh/notifyosd.zsh

# }}}
