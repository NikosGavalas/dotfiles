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

echo "backing up old files and fetching the new ones..."
for file in "${FILES[@]}"; do
    mv "$HOME/${file}" "$HOME/${file}.old" 2>/dev/null || echo "creating ${file}..."
    curl -fsSL -o "$HOME/${file}" "https://raw.githubusercontent.com/NikosGavalas/dotfiles/master/${file}" && "created ${file}"
done

echo "Done. You can reset configuration files by running \"rollback_config\""
