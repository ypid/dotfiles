# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

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
# }}}

# plugins {{{
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#
# Mandatory
plugins=(gitfast autojump git-annex)
# plugins=(tmuxinator)
[[ -e ~/gems/gems/tmuxinator-0.6.8/completion/tmuxinator.zsh ]] && source ~/gems/gems/tmuxinator-0.6.8/completion/tmuxinator.zsh

# Nice to have
plugins+=(command-not-found zsh-syntax-highlighting mosh)

# Additional functions
plugins+=(debian)
plugins+=(encode64)
plugins+=(urltools)

# Testing

# Not tested enough, might be useful
: <<'END'
plugins+=(vi-mode)

plugins+=(git-flow)
# I only maintain small projects for which it is not worth the cost (yet?). Also a concern is that contributers might get confused and will not use the same development model.

END

# Not needed
: <<'END'
plugins+=(lol)
plugins+=(per-directory-history)
plugins+=(rand-quote)

END

# tested and decided not to use
: <<'END'
plugins+=(tmux) # Did not work
plugins+=(last-working-dir) # does break 'open in Terminal' of nautilus and nemo

END
# echo "Loaded plugins: $plugins"
#
# }}}

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Own theme based on dieter and bira {{{

# local time, color coded by last return code
# time_enabled="%(?.⌚ %{$fg[green]%}.%{$fg[red]%})%*%{$reset_color%}"
time_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})%*%{$reset_color%}"
time_disabled="%{$fg[green]%}%*%{$reset_color%}"
time=$time_enabled

# user part, color coded by privileges
local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'

local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'

local git_branch='$(git_prompt_info)%{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

PROMPT="╭─${time} ${user_host}${current_dir} ${git_branch}
╰─%B$%b "

# elaborate exitcode on the right when >0
return_code_enabled="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
return_code_disabled=
return_code=$return_code_enabled

RPS1='${return_code}'

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
source ~/.shellrc
source ~/.zsh_bindings
