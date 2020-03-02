if [ -d "${ZSH_CUSTOM}/themes/powerlevel10k" ]; then
    git -C ~$ZSH_CUSTOM/themes/powerlevel10k pull
else
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
fi
