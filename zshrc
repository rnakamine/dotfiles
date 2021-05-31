export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh

CURRENT_DIRECTORY="%{$fg[green]%}%{$fg[cyan]%}%~"
CURRENT_BRANCH="%{$fg_bold[blue]%}\$(git_prompt_info)%{$fg[blue]%}%"

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

PROMPT="$CURRENT_DIRECTORY $CURRENT_BRANCH %{$reset_color%}
$ "

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on

# ghq
alias g='cd $(ghq root)/$(ghq list | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# rbenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(rbenv init -)"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

export PATH="$HOME/bin:$PATH"

# bmfzf
alias chr='open -a "/Applications/Google Chrome.app" $(bmfzf)'

# docker-compose
alias dc='docker-compose'

# git
alias ga='git add'
alias gcm='git commit'
alias gpo='git push origin'
alias gco='git checkout'

# venv
alias venv='. venv/bin/activate'

# tmux
# t () {
# 	tmux attach -t $1 2> /dev/null || tmux new -s $1 2> /dev/null || tmux ls
# }

setopt +o nomatch 

# direnv
export EDITOR=vi
eval "$(direnv hook zsh)"
alias direnv='direnv edit .'

# setting AZURE_STORAGE_CONNECTION_STRING
set-azstg() {
    NAME=$(az storage account list --query [].name --output tsv | peco)
    echo Setting the value of AZURE_STORAGE_CONNECTION_STRING to $NAME ..
    RESOURCE_GROUP=$(az storage account list --query [].[name,resourceGroup] --output tsv | grep ${NAME} | awk '{print $2}')
    export AZURE_STORAGE_CONNECTION_STRING=$(az storage account show-connection-string -g ${RESOURCE_GROUP} -n ${NAME} --output tsv | awk '{print $1}')
    echo Done.
}

# show grobal ip
alias showip='curl ipaddr.show'

# reset venv
venv-reset() {
    deactivate
    python -m venv --clear venv
    source venv/bin/activate
}

# trash-cli
if type trash-put &> /dev/null
then
    alias rm=trash-put
fi
