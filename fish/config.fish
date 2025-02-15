function fish_prompt
  set -g fish_prompt_pwd_dir_length 0
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color yellow
  echo -e (__fish_git_prompt)
  set_color $fish_color_cwd
  echo -n '$ '
end

set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_STATE_HOME $HOME/.local/state
set -x XDG_CACHE_HOME $HOME/.cache

set PATH /opt/homebrew/bin $PATH
set -gx PATH $PATH $HOME/.krew/bin $HOME/go/bin
set -x EDITOR vi
set -x GITHUB_TOKEN (gh auth token)

alias gst='git status'
alias gd='git diff'
alias gpo='git push origin'
alias gco='git checkout'
alias gp='git pull'
alias gb="git branch | fzf | xargs git checkout"
alias k='kubectl'
alias kx='kubectx | fzf | xargs kubectx'
alias kns='kubens | fzf | xargs kubens'
