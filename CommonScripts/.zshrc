export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=1
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:$GOBIN
export LANG=en_US.UTF-8
export SSH_KEY_PATH="~/.ssh/dsa_id"

ZSH_THEME="agnoster"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias zshconfig="vim ~/.zshrc"
