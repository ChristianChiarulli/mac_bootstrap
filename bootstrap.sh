#!/bin/bash

./install_programs.sh
touch ~/.hushlogin

if [ ! -f ~/.zshrc ]; then
    echo ".zshrc not found installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# Install nvm for node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

nvm install --lts

mkdir ~/.config
git clone git@github.com:ChristianChiarulli/nvim.git
mv nvim ~/.config

sh ~/.config/nvim/install/install.sh



