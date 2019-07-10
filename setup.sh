#!/bin/bash

FILES=(".bashrc" ".vimrc" ".gitconfig")

for file in "${FILES[@]}"; do
    mv "$HOME/${file}" "$HOME/${file}.old" 2> /dev/null || echo "created ${file}"
    curl -fsSL -o $HOME/${file} "https://raw.githubusercontent.com/NikosGavalas/dotfiles/master/${file}"
done

