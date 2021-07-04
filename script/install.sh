#!/bin/sh

DIR=$(cd $(dirname $0)/.. && pwd)

CONFIGS=(
  zshrc
  vimrc
  tmux.conf
  gitconfig
  gitignore_global
  vim/autoload/plug.vim
)

for CONFIG in ${CONFIGS[@]}
do
  if [ ! -f ${HOME}/.${CONFIG} ]; then
    echo "[INFO] Place ${HOME}/.${CONFIG}"
    ln -s ${DIR}/${CONFIG} ${HOME}/.${CONFIG}
  fi
done

if [ ! -d "${HOME}/.config/base16-shell" ]; then
    mkdir -p ${HOME}/.config/
    ln -s ${DIR}/zsh/base16-shell ${HOME}/.config/
    echo "[INFO] Setup base16shell is complete."
fi

echo "[INFO] Done."
