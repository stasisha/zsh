#!/bin/bash

addLineToTopIfNotExists() {
  local LINE=$1
  local FILE=$2
  sudo grep -qF -- "$LINE" "$FILE" || echo -e  "$LINE""\n$(cat todo.txt)" > todo.txt
}

brew install fzf

rm -rf ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

curl -L https://raw.githubusercontent.com/stasisha/zsh/master/.appearance -o ~/.appearance

addLineToTopIfNotExists "source ~/.appearance" ~/.zshrc

#oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

source ~/.zshrc
