fpath=(/usr/local/share/zsh/functions ${fpath})
for f (~/Development/src/github.com/rnakamine/dotfiles/zsh/function/*.zsh) source "${f}"

bindkey -e
setopt +o nomatch 
export PATH="$HOME/bin:$PATH"

# Prompt
autoload -Uz vcs_info
setopt prompt_subst
setopt prompt_percent
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats '[%b] %c%u'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
PROMPT='%F{cyan}%~ %F{blue}${vcs_info_msg_0_}%f
$ '

# Completion
autoload -U compinit && compinit
setopt auto_list
setopt list_packed
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:default' menu select=1

# Histroy
setopt hist_ignore_dups
setopt share_history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on

# ghq
alias g='cd $(ghq root)/$(ghq list | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'

# alias
alias ls='ls -G'
alias ll='ls -l'
alias l='ls -la'

alias dc='docker compose'

alias gst='git status'
alias gd='git diff'
alias gpo='git push origin'
alias gco='git checkout'

alias venv='. venv/bin/activate'

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
