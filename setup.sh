#!/bin/bash

DOT_FILES=(.zshrc .vimrc .gitignore_global)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done