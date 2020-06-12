# ==============================================================================
# GENERAL
# ==============================================================================

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# ==============================================================================
# HISTORY 
# ==============================================================================

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000
HISTIGNORE="&:pwd:ls:[bf]g:exit"

# ==============================================================================
# PROMPT
# ==============================================================================

check_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

get_prompt() {
    local EXITSTATUS="$?"

    local BOLD="\[\033[1m\]"
    local BGREEN='\[\033[1;32m\]'
    #local GREEN='\[\033[0;32m\]'
    local BRED='\[\033[1;31m\]'
    #local RED='\[\033[0;31m\]'
    #local BBLUE='\[\033[1;34m\]'
    #local BLUE='\[\033[0;34m\]'
    local NORMAL='\[\033[00m\]'
    #local YELLOW='\[\033[33m\]'
    #local CYAN='\[\033[0;36m\]'
    #local BCYAN='\[\033[1;36m\]'

    local USYMBOL='$'
    local UCOLOR=${BOLD}
    if [ "$EUID" -eq 0 ]; then
        USYMBOL='#'
        UCOLOR=${BRED}
    fi

    if [ "${EXITSTATUS}" -eq 0 ]; then
        PROMPT="${BGREEN}${USYMBOL}${NORMAL}"
    else
        PROMPT="${BRED}${USYMBOL}${NORMAL}"
    fi

    PS1="${UCOLOR}\h${NORMAL} ${PROMPT} "
}

PROMPT_COMMAND=get_prompt

# ==============================================================================
# COMPLETION
# ==============================================================================

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# ==============================================================================
# ENV VARS, ALIASES, FUNCTIONS
# ==============================================================================

[[ -f ~/.env ]] && . ~/.env
[[ -f ~/.aliases ]] && . ~/.aliases
[[ -f ~/.functions ]] && . ~/.functions
