#!/bin/bash

source /dev/stdin <<< "$(curl -fsSL https://raw.githubusercontent.com/stasisha/bash-utils/master/file-edit.sh)";

if [ -d "${ZSH_CUSTOM}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
else
    git -C ~ZSH_CUSTOM/themes/powerlevel10k pull
fi

curl -L https://raw.githubusercontent.com/stasisha/zsh/master/.appearance.sh -o ~/.appearance.sh

removeLine 'source $ZSH\/oh-my-zsh.sh' ~/.zshrc
addLineToBottomIfNotExists 'source ~/.appearance.sh' ~/.zshrc
addLineToBottomIfNotExists 'source $ZSH/oh-my-zsh.sh' ~/.zshrc

zsh -l

