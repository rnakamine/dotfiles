function fish_prompt
  set -g fish_prompt_pwd_dir_length 0
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color yellow
  echo -e (__fish_git_prompt)
  set_color $fish_color_cwd
  echo -n '$ '
end

set -Ux FZF_DEFAULT_OPTS --layout=reverse
set -x EDITOR nvim
set -gx PATH $PATH $HOME/.krew/bin

alias vim='nvim'
alias gst='git status'
alias gd='git diff'
alias gpo='git push origin'
alias gco='git checkout'
alias gp='git pull'
alias gb="git branch | fzf | xargs git checkout"
alias k='kubectl'
alias kx='kubectx | fzf | xargs kubectx'
alias kns='kubens | fzf | xargs kubens'
alias pepassh='envchain nyah pepassh'

set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux PATH  $PYENV_ROOT/bin $PATH
pyenv init - | source

eval (direnv hook fish)
