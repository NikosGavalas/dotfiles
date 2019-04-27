#!/bin/bash

ESSENTIAL="git vim bash-completion"
MONITORING="glances htop iotop iftop"
DEVELOPMENT="build-essential python3 gcc g++ binutils"
UTILS="bc tree screen" #nnn"

FILES=(".bashrc" ".vimrc" ".gitconfig")

if ! command -v curl &>/dev/null; then
    echo "Error: Install curl first" >&2
    exit 1
fi

for file in "${FILES[@]}"
do
    mv "$HOME/${file}" "$HOME/${file}.old" || echo "created ${file}"
    curl -fsSL -o $HOME/${file} "https://raw.githubusercontent.com/NikosGavalas/dotfiles/master/${file}"
done

read -p "Install packages now? [y/n]" -n 1 -r

echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt update && sudo apt upgrade -y
    sudo apt install ${ESSENTIAL} ${MONITORING} ${DEVELOPMENT} ${UTILS} -y
fi
