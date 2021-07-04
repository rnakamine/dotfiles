if test ! $(which brew); then
    echo "[INFO] Installing homebrew."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
    cask
    go
    rmtrash       
    jq
    peco   
    ghq
    tfenv
    rbenv
    pyenv
    direnv
)
brew install ${formula[@]} && brew cleanup

# https://github.com/Homebrew/homebrew-cask
echo "[INFO] Installing casks."
casks=(
     visual-studio-code
     vagrant
     docker
)
brew cask install ${casks[@]} && brew cleanup
