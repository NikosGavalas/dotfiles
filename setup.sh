#!/bin/bash

FILES=(".bashrc" ".vimrc" ".gitconfig" "apt.sh")

if ! command -v curl &>/dev/null; then
    echo "Error: Install curl first" >&2
    exit 1
fi

for file in "${FILES[@]}"
do
    mv "$HOME/${file}" "$HOME/${file}.old" || true
    curl -L -s -o $HOME/${file} "https://raw.githubusercontent.com/NikosGavalas/dotfiles/master/${file}"
done

read -p "Install packages now? [y/n]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo bash $HOME/apt.sh
fi
