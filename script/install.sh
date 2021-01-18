#!/bin/sh

DIR=$(cd $(dirname $0)/.. && pwd)

CONFIGS=(
  zshrc
  vimrc
  tmux.conf
  gitconfig
)

for CONFIG in ${CONFIGS[@]}
do
  if [ ! -f ${HOME}/.${CONFIG} ]; then
    echo "[INFO] Place ${HOME}/.${CONFIG}"
    ln -s ${DIR}/${CONFIG} ${HOME}/.${CONFIG}
  fi
done

# Base16 Shell install
BASE16_SHELL="$HOME/.config/base16-shell/"
if [ ! -d $BASE16_SHELL ]; then
    git clone https://github.com/chriskempson/base16-shell.git $HOME/.config/base16-shell
    echo "[INFO] Installation of base16shell is complete."
fi

echo "[INFO] Done."
