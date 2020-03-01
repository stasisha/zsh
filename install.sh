#!/bin/bash

source <(curl -fsSL https://raw.githubusercontent.com/stasisha/bash-utils/master/file-edit.sh)

brew install fzf

rm -rf ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

curl -L https://raw.githubusercontent.com/stasisha/zsh/master/.appearance -o ~/.appearance

#oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

addLineBeforeLineIfNotExists "source ~/.appearance" "source $ZSH/oh-my-zsh.sh" ~/.zshrc

source ~/.zshrc
