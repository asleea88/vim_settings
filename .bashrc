set -o vi

# bash color
export PS1="\[\033[36m\]\u\[\033[m\]:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

# vi mode
export EDITOR=vi

# bash alias
alias sbashrc="source ~/.bash_profile"
alias bashrc="vi ~/.bash_profile"
alias vimrc="vi ~/.vimrc"
alias awsrc="vi ~/.aws/credentials"
alias awsrc2="vi ~/.aws/config"

# git alias
alias gs="git status"
alias gd="git diff"
alias gb="git branch"

# git-auto-complete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# pyenv alias
alias da="pyenv deactivate"
eval "$(pyenv init -)"
