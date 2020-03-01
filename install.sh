#!/bin/bash

addLineIfNotExists() {
  local LINE=$1
  local FILE=$2
  sudo grep -qF -- "$LINE" "$FILE" || echo "$LINE" | sudo tee -a "$FILE"
}

#oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

rm -rf ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

sed -i '' '/### appearance start ###/,/### appearance end ###/d' ~/.zshrc
addLineIfNotExists "### appearance start ###" ~/.zshrc
addLineIfNotExists "source ~/.appearance" ~/.zshrc
addLineIfNotExists "### appearance end ###" ~/.zshrc

source ~/.zshrc
