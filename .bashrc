# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

ypid_dotfiles_level="full"
if [ -n "$SSHHOME" ] && [ ! -e "$HOME/.config/dotfiles/.reuse/dep5" ]; then
    ypid_dotfiles_level="min"

    XDG_CONFIG_HOME="$SSHHOME/.sshrc.d/.config"
    export XDG_CONFIG_HOME

    PATH="${PATH:+"$PATH:"}$SSHHOME/.sshrc.d/scripts"
fi

if [ -n "$OSTYPE" ] && [ -x /usr/local/opnsense/scripts/shell/banner.php ]; then
    /usr/local/opnsense/scripts/shell/banner.php
    echo
    alias vi='vim'
    alias ls="ls -D '%F %T'"
    alias l="ls -lh"
    alias ll="ls -lha"
else
    source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/tmux-attach"
fi

## Misuse bash as hook into termux-chroot and zsh.
## termux-chroot is slower so don’t use it by default for now.
# if [ -n "$ANDROID_ROOT" ]; then
#     if [ -d /bin ]; then
#         exec zsh
#     else
#         exec termux-chroot zsh
#     fi
# fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=52300000
export HISTTIMEFORMAT='%F %T '

log_bash_eternal_history()
{
    local rc=$?
    [[ $(history 1) =~ ^\ *[0-9]+\ +([^\ ]+\ [^\ ]+)\ +(.*)$ ]]
    local date_part="${BASH_REMATCH[1]}"
    local command_part="${BASH_REMATCH[2]}"
    if [ "$command_part" != "$ETERNAL_HISTORY_LAST" -a "$command_part" != "ls" -a "$command_part" != "ll" ]
    then
        echo $date_part $HOSTNAME $rc "$command_part" >> ~/.shell_eternal_history
        export ETERNAL_HISTORY_LAST="$command_part"
    fi
}

# PROMPT_COMMAND="log_bash_eternal_history"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\H:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\H: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# shellcheck source=shell_global
source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/global"

alias '+'='pushd'

## Set the thing to vi editing mode :)
set -o vi

bind -m vi-insert "\C-o":dynamic-complete-history
bind -m vi-insert "\C-l":clear-screen
bind -m vi-insert "\C-p":previous-history
bind -m vi-insert "\C-n":next-history

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
# if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    # . /etc/bash_completion
# fi
