DIR=$(cd $(dirname $0)/.. && pwd)
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}

CONFIGS=(
  fish
  git
  tmux
)

for CONFIG in ${CONFIGS[@]}
do
  if [ ! -e ${XDG_CONFIG_HOME}/${CONFIG} ]; then
    echo "[INFO] Place ${XDG_CONFIG_HOME}/${CONFIG}"
    ln -s ${DIR}/${CONFIG} ${XDG_CONFIG_HOME}/${CONFIG}
  fi
done

# fish settings
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish

# install fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher update

echo "[INFO] Done."
