#!/bin/bash

ESSENTIAL="git vim bash-completion"
MONITORING="glances htop iotop iftop"
DEVELOPMENT="build-essential zsh neovim python3 gcc g++ binutils"
UTILS="bc tree screen tmux" #nnn"

read -p "Install packages now? [y/n]" -n 1 -r

echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt update && sudo apt upgrade -y
    sudo apt install ${ESSENTIAL} ${MONITORING} ${DEVELOPMENT} ${UTILS} -y
fi

