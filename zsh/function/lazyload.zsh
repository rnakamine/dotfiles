# pyenv() {
#     unfunction pyenv
#     source <(pyenv init --path)
#     source <(pyenv init -)
#     pyenv "$@"
# }
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# rbenv() {
#     unfunction rbenv
#     source <(rbenv init -)
#     rbenv "$@"
# }
eval "$(rbenv init -)"

# direnv() {
#     unfunction direnv
#     source <(direnv hook zsh)
#     direnv "$@"
# }
export EDITOR=vim
eval "$(direnv hook zsh)"
