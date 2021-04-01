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

echo "[INFO] Done."
