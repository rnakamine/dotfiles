set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_STATE_HOME $HOME/.local/state
set -x XDG_CACHE_HOME $HOME/.cache

set PATH /opt/homebrew/bin $PATH
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -gx PATH $PATH $HOME/.krew/bin $HOME/go/bin
set -x EDITOR vi
set -x GITHUB_TOKEN (gh auth token)
set -x PATH $PATH (go env GOBIN)

set -g async_prompt_functions _pure_prompt_git

set -x EDITOR nvim

alias gst='git status'
alias gd='git diff'
alias gpo='git push origin $(git branch --show-current)'
alias gco='git checkout'
alias gp='git pull'
alias gb="git branch | fzf | xargs git checkout"
alias k='kubectl'
alias kx='kubectx | fzf | xargs kubectx'
alias kns='kubens | fzf | xargs kubens'
alias vim='nvim'
alias c='claude'
alias mkday='mkdir -p (date +%Y-%m-%d)'

# ASDF configuration code
if test -z $ASDF_DATA_DIR
  set _asdf_shims "$HOME/.asdf/shims"
else
  set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
  set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

function _set_k8s_prompt --argument-names enabled
  if test "$enabled" = "true"
    set --universal pure_enable_k8s true
    set --universal pure_enable_single_line_prompt false
  else
    set --universal pure_enable_k8s false
    set --universal pure_enable_single_line_prompt true
  end
end

_set_k8s_prompt false

function toggle_k8s_prompt
  if test "$pure_enable_k8s" = "true"
    _set_k8s_prompt false
  else
    _set_k8s_prompt true
  end
  commandline -f repaint
end

bind \co toggle_k8s_prompt
