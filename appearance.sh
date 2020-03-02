#!/bin/bash

source /dev/stdin <<< "$(curl -fsSL https://raw.githubusercontent.com/stasisha/bash-utils/master/file-edit.sh)";

if [ -d "~/.oh-my-zsh/custom/themes/powerlevel9k" ]; then
    git -C ~/.oh-my-zsh/custom/themes/powerlevel9k pull
else
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

if [ -d "~/powerlevel10k" ]; then
    git -C ~/powerlevel10k pull
else
   git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
fi

curl -L https://raw.githubusercontent.com/stasisha/zsh/master/.appearance.sh -o ~/.appearance.sh

cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
cd -

removeLine 'source $ZSH\/oh-my-zsh.sh' ~/.zshrc
addLineToBottomIfNotExists 'source ~/.appearance.sh' ~/.zshrc
addLineToBottomIfNotExists 'source $ZSH/oh-my-zsh.sh' ~/.zshrc

echo "Select DroidSansMono Nerd Font in iterm2 Preferences."

zsh -l

