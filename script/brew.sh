#!/bin/sh

if test ! $(which brew); then
    echo "[INFO] Installing homebrew."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

printf "Update recipes? [Y/n]: " && read flag
if [ "${flag}" = "y" ] || [ "${flag}" = "Y" ]; then
    brew update
fi

printf "Upgrade? [Y/n]: " && read flag
if [ "${flag}" = "y" ] || [ "${flag}" = "Y" ]; then
    brew update
    brew upgrade
fi

# https://formulae.brew.sh/formula/
echo "[INFO] Installing fomulas."
formula=(
    grep
    curl
    wget
    tree
    tmux
    hub 
    tig
    go
    jq
    peco   
    ghq
    tfenv
    rbenv
    pyenv
    direnv
    htop
)
brew install ${formula[@]} && brew cleanup

# https://github.com/Homebrew/homebrew-cask
echo "[INFO] Installing casks."
casks=(
    docker
    vagrant
    virtualbox
    visual-studio-code
)
brew install --cask ${casks[@]} && brew cleanup
