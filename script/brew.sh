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

brew bundle
