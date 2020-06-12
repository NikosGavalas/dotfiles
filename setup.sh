#!/bin/bash

FILES=(
    ".aliases"
    ".bash_completion"
    ".bashrc"
    ".env"
    ".functions"
    ".gitconfig"
    ".tmux.conf"
    ".vimrc"
    ".zshrc"
)

echo "backing up old files and fetching the new ones..."
for file in "${FILES[@]}"; do
    mv "$HOME/${file}" "$HOME/${file}.old" 2>/dev/null || echo "creating ${file}..."
    curl -fsSL -o "$HOME/${file}" "https://raw.githubusercontent.com/NikosGavalas/dotfiles/master/src/${file}"
done

rollback_config() {
    for file in "${FILES[@]}"; do
        mv "$HOME/${file}.old" "$HOME/${file}" 2>/dev/null || (rm "$HOME/${file}" && echo "removed ${file}")
    done
}

export -f rollback_config

echo "Done. You can reset configuration files by running \"rollback_config\""
