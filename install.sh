#!/bin/bash

source /dev/stdin <<< "$(curl -fsSL https://raw.githubusercontent.com/stasisha/bash-utils/master/brew.sh)";

brew-install-if-not-installed "fzf"

#oh-my-zsh
if [ -d "~/.oh-my-zsh" ]; then
    git -C ~/.oh-my-zsh pull
else
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi
rm -f ~/.zshrc
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

zsh -l
