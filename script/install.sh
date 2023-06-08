DIR=$(cd $(dirname $0)/.. && pwd)

CONFIGS=(
  vim
  tmux
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

# Neovim
if [ ! -d "${HOME}/.config/nvim" ]; then
    mkdir -p ${HOME}/.config/
    ln -s ${DIR}/nvim ${HOME}/.config/
    # Install vim-plug
    curl -sS -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dir \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "[INFO] Setup Neovim is complete."
fi

echo "[INFO] Done."
