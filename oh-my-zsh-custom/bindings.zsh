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
