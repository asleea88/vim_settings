set -o vi
export CLICOLOR=1

# bash alias
alias sbashrc="source ~/.bash_profile"
alias bashrc="vi ~/.bash_profile"
alias vimrc="vi ~/.vimrc"

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
