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

if [ ! -d "${HOME}/.config/base16-shell" ]; then
    mkdir -p ${HOME}/.config/
    ln -s ${DIR}/zsh/base16-shell ${HOME}/.config/
    echo "[INFO] Setup base16shell is complete."
fi

echo "[INFO] Done."
