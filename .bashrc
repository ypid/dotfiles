# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5230000
HISTFILESIZE=5230000

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -f ~/.bash_aliases_public ]; then
    . ~/.bash_aliases_public
fi
if [ -f ~/.bash_aliases_privat ]; then
    . ~/.bash_aliases_privat
fi
if [ -f ~/.bash_aliases_local ]; then
    . ~/.bash_aliases_local
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export PERL_LOCAL_LIB_ROOT="$HOME/.cpan/perl5";
export PERL_MB_OPT="--install_base $HOME/.cpan/perl5";
export PERL_MM_OPT="INSTALL_BASE=$HOME/.cpan/perl5";
export PERL5LIB="$HOME/Projekte/Programmiersprachen/Perl/lib:$HOME/.cpan/perl5/lib/perl5";
if [ "`getconf LONG_BIT`" == "64" ]; then ## Running under a 64 Bit Kernel
	PERL5LIB="$HOME/.cpan/perl5/lib/perl5/x86_64-linux-gnu-thread-multi:$PERL5LIB"
else
	PERL5LIB="$HOME/.cpan/perl5/lib/perl5/i486-linux-gnu-thread-multi::$PERL5LIB"
fi
export PATH="$PATH:$HOME/.cpan/perl5/bin:$HOME/.User-bin/gnuarm/bin";

if [ -d "$HOME/Skripte" ] ; then
    PATH="$HOME/Skripte:$PATH"
fi

function up {
[ "${1/[^0-9]/}" == "$1" ] && {
	local ups=""
	for i in $(seq 1 $1)
	do
		ups=$ups"../"
	done
	cd $ups
	} || echo "usage: up INTEGER"
}
