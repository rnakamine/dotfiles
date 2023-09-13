DIR=$(cd $(dirname $0)/.. && pwd)

CONFIGS=(
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

if [ ! -d "${HOME}/.config/fish" ]; then
    mkdir -p ${HOME}/.config/
    ln -s ${DIR}/fish ${HOME}/.config/
    echo "[INFO] Setup fish is complete."
fi

echo "[INFO] Done."
