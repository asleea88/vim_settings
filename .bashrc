#!/bin/bash
set -o vi

# bash color
export PS1="\[\033[36m\]\u\[\033[m\]:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

export EDITOR=vi

# bash alias
alias sbashrc="source ~/.bash_profile"
alias bashrc="vi ~/.bash_profile"
alias vimrc="vi ~/.vimrc"
alias awsrc="vi ~/.aws/credentials"
alias awsrc2="vi ~/.aws/config"
alias mfarc="vi ~/.aws/mfa_authenticator.ini"
alias sniprc="vi ~/.vim/bundle/vim-snippets/UltiSnips/all.snippets"

# git alias
alias gs="git status"
alias gd="git diff"
alias gb="git branch"
alias gl="git log"
alias lg="lazygit"

export PATH=$PATH:/opt/homebrew/bin

#tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# git-auto-complete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# pyenv alias
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
alias da="pyenv deactivate"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source /Users/sam/.docker/init-bash.sh || true # Added by Docker Desktop

unset DOCKER_HOST
