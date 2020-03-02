#!/bin/bash

source /dev/stdin <<< "$(curl -fsSL https://raw.githubusercontent.com/stasisha/bash-utils/master/brew.sh)";

brew-install-if-not-installed "fzf"

cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
cd -

#oh-my-zsh
if [ -d "~/.oh-my-zsh" ]; then
    git -C ~/.oh-my-zsh pull
else
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi
rm -f ~/.zshrc
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

zsh -l
