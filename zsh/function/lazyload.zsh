pyenv() {
    unfunction pyenv
    source <(pyenv init --path)
    source <(pyenv init -)
    pyenv "$@"
}

rbenv() {
    unfunction rbenv
    source <(rbenv init -)
    rbenv "$@"
}

direnv() {
    unfunction direnv
    source <(direnv hook zsh)
    direnv "$@"
}
