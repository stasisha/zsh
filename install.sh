#!/bin/bash

source /dev/stdin <<< "$(curl -fsSL https://raw.githubusercontent.com/stasisha/bash-utils/master/file-edit.sh)";
source /dev/stdin <<< "$(curl -fsSL https://raw.githubusercontent.com/stasisha/bash-utils/master/brew.sh)";

brew-install-if-not-installed "fzf"

if [ -d "~/.oh-my-zsh/custom/themes/powerlevel9k" ]; then
    git -C ~/.oh-my-zsh/custom/themes/powerlevel9k pull
else
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

curl -L https://raw.githubusercontent.com/stasisha/zsh/master/.appearance -o ~/.appearance

#oh-my-zsh
if [ -d "~/.oh-my-zsh" ]; then
    git -C ~/.oh-my-zsh pull
else
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi
rm -f ~/.zshrc
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

removeLine 'source $ZSH\/oh-my-zsh.sh' ~/.zshrc
addLineToBottomIfNotExists 'source ~/.appearance' ~/.zshrc
addLineToBottomIfNotExists 'source $ZSH/oh-my-zsh.sh' ~/.zshrc

cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
cd -

echo "Select DroidSansMono Nerd Font in iterm2 Preferences."

zsh -l
