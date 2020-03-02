
#!/bin/bash

source /dev/stdin <<< "$(curl -fsSL https://raw.githubusercontent.com/stasisha/bash-utils/master/file-edit.sh)";

removeLine 'source $ZSH\/oh-my-zsh.sh' ~/.zshrc
addLineToBottomIfNotExists 'source ~/.appearance' ~/.zshrc
addLineToBottomIfNotExists 'source $ZSH/oh-my-zsh.sh' ~/.zshrc

echo "Select DroidSansMono Nerd Font in iterm2 Preferences."

zsh -l

