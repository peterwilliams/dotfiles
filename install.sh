#!/bin/bash

DOTFILES_DIR="$HOME/development/code/dotfiles"
FILES='.aliases
.bash_profile
.bash_prompt
.editorconfig
.functions
.gitconfig
.gitignore
.npmrc
bin'

for file in $FILES; do
    echo "Creating symlink to $file in ~ ."
    ln -sfv $DOTFILES_DIR/$file $HOME/$file
done
