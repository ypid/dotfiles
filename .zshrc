# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="random"

# ordered after preference.
ZSH_THEME="bira"
# ZSH_THEME="fino"
# ZSH_THEME="pygmalion"
# ZSH_THEME="funky"
# ZSH_THEME="josh"
# ZSH_THEME="dieter"
# ZSH_THEME="dallas"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="rixius"
# ZSH_THEME="fishy"
# ZSH_THEME="jonathan"
# ZSH_THEME="xiong-chiamiov-plus"
# ZSH_THEME="blinks"
# ZSH_THEME="fwalch"
# ZSH_THEME="blinks"
# ZSH_THEME="jnrowe"
# ZSH_THEME="steeef"
# ZSH_THEME="dpoggi"
# ZSH_THEME="cypher"
#
# ZSH_THEME="dpoggi"
#
# ZSH_THEME="trapd00r"            # prompt_jnrowe_precmd:20: command not found: zsh_path
# ZSH_THEME="miloshadzic"         # no full path
# ZSH_THEME="jnrowe"              # uses yellow
# ZSH_THEME="dogenpunk"           # too slow
# ZSH_THEME="frisk"               # too slow
#

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git command-not-found autojump zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# like eternal history
SAVEHIST=100000000

source ~
unalias md
setopt no_share_history
source ~/.shellrc
source ~/.zsh_bindings
