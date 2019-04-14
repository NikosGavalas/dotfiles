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
HISTSIZE=1000
HISTFILESIZE=2000

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
    local GREEN='\[\033[0;32m\]'
    local BRED='\[\033[1;31m\]'
    local RED='\[\033[0;31m\]'
    local BBLUE='\[\033[1;34m\]'
    local BLUE='\[\033[0;34m\]'
    local NORMAL='\[\033[00m\]'
    local YELLOW='\[\033[33m\]'
    local CYAN='\[\033[0;36m\]'
    local BCYAN='\[\033[1;36m\]'

    if [ "${EXITSTATUS}" -eq 0 ]
    then
        PROMPT="${BGREEN}$ ${NORMAL}"
    else
        PROMPT="${BRED}$ ${NORMAL}"
    fi

    PS1="${BRED}\u@\h${NORMAL}:${BBLUE}\w${YELLOW}\$(check_branch)${PROMPT}"
}

PROMPT_COMMAND=get_prompt

# ==============================================================================
# COLOR & ALIASES
# ==============================================================================

# enable color support of various commands
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias back='cd $OLDPWD'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ports='netstat -tulanp'
alias update='sudo apt-get update && sudo apt-get upgrade -y'
alias naut='nautilus'
alias beep='paplay $BEEP'
alias svim='sudo vim'
alias get='curl -L'
#alias mv='mv -i'
#alias cp='cp -i'
#alias ln='ln -i'


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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
# PATH AND VARIABLES
# ==============================================================================

export PATH=$PATH:~/code/
export PATH=$PATH:~/anaconda3/bin
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:/opt/node-v10.14.1-linux-x64/bin
export BEEP=/usr/share/sounds/gnome/default/alerts/glass.ogg

# ==========
# GIT
# ==========

branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

commit() {
    git add .
    git commit -m "$1"
}

pull() {
    git pull origin "$(branch)"
}

push() {
    if [ -z "$1" ]; then
        git push origin "$(branch)"
    else
        commit "$1"
        git push origin "$(branch)"
    fi
}

# ==============================================================================
# UTILITIES
# ==============================================================================

extract() {
    local x
    ee() { # echo and execute
        echo "$@"
        $1 "$2"
    }
    for x in "$@"; do
        [[ -f $x ]] || continue
        case "$x" in
            *.tar.bz2 | *.tbz2 )    ee "tar xvjf" "$x"  ;;
            *.tar.gz | *.tgz ) ee "tar xvzf" "$x"   ;;
            *.bz2 )             ee "bunzip2" "$x"   ;;
            *.rar )             ee "unrar x" "$x"   ;;
            *.gz )              ee "gunzip" "$x"    ;;
            *.tar )             ee "tar xvf" "$x"   ;;
            *.zip )             ee "unzip" "$x"     ;;
            *.Z )               ee "uncompress" "$x" ;;
            *.7z )              ee "7z x" "$x"      ;;
        esac
    done
}

cd() {
    new_directory="$*";
    if [ $# -eq 0 ]; then 
        new_directory=${HOME};
    fi;
    builtin cd "${new_directory}" && ls
}

speedtest() {
    curl -L https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
}

# ==============================================================================
# GO
# ==============================================================================

export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# ==============================================================================
# CONDA
# ==============================================================================

# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/nick/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/nick/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/nick/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/nick/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
