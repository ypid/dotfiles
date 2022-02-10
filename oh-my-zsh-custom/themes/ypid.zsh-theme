# SPDX-FileCopyrightText: 2014,2021-2022 Robin Schneider <ypid@riseup.net>
# SPDX-FileCopyrightText: Authors of dieter and bira

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo "(venv: $(basename "$VIRTUAL_ENV")) "
}
local virtualenv_prompt='$(virtualenv_info)'

# Own theme based on dieter and bira

# local time, color coded by last return code
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
if [ "$DEPLOYMENT" = "production" ] || [[ $HOSTNAME == *prod* ]]; then
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

PROMPT="╭─ ${time} ${user_host}${current_dir}${git_branch}${virtualenv_prompt} ${return_code}
╰─ %B%(!.#.$)%b "
RPROMPT=""

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
