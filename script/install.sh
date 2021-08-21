DIR=$(cd $(dirname $0)/.. && pwd)

CONFIGS=(
  vim
  vimrc
  zshrc
  tmux.conf
  gitconfig
  gitignore_global
)
for CONFIG in ${CONFIGS[@]}
do
  if [ ! -e ${HOME}/.${CONFIG} ]; then
    echo "[INFO] Place ${HOME}/.${CONFIG}"
    ln -s ${DIR}/${CONFIG} ${HOME}/.${CONFIG}
  fi
done

echo "[INFO] Done."
