if test ! $(which /opt/homebrew/bin/brew); then
    echo "[INFO] Installing homebrew."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

printf "Update recipes? [Y/n]: " && read flag
if [ "${flag}" = "y" ] || [ "${flag}" = "Y" ]; then
    /opt/homebrew/bin/brew update
fi

printf "Upgrade? [Y/n]: " && read flag
if [ "${flag}" = "y" ] || [ "${flag}" = "Y" ]; then
    /opt/homebrew/bin/brew update
    /opt/homebrew/bin/brew upgrade
fi

/opt/homebrew/bin/brew bundle
