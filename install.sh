#!/bin/bash

source /dev/stdin <<< "$(curl --insecure https://raw.githubusercontent.com/stasisha/bash-utils/master/file-edit.sh)";
source /dev/stdin <<< "$(curl --insecure https://raw.githubusercontent.com/stasisha/bash-utils/master/brew.sh";

brew-install-if-not-installed fzf

if [ -d "~/.oh-my-zsh/custom/themes/powerlevel9k" ]; then
    git -C ~/.oh-my-zsh/custom/themes/powerlevel9k pull
else
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

curl -L https://raw.githubusercontent.com/stasisha/zsh/master/.appearance -o ~/.appearance

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

addLineBeforeLineIfNotExists "source ~/.appearance" "source \$ZSH/oh-my-zsh.sh" ~/.zshrc

source ~/.zshrc
