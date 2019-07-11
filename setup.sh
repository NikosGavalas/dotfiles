#!/bin/bash

FILES=(
    ".bashrc"
    ".zshrc"
    ".commonrc"
    ".vimrc"
    ".gitconfig"
    ".tmux.conf"
    ".config/nvim/init.vim"
    ".config/Code/User/settings.json"
)

echo "backing up old files..."
for file in "${FILES[@]}"; do
    mv "$HOME/${file}" "$HOME/${file}.old" 2> /dev/null || echo "created ${file}"
    curl -fsSL -o $HOME/${file} "https://raw.githubusercontent.com/NikosGavalas/dotfiles/master/${file}"
done
