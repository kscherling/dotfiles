#!/bin/sh
export HISTCONTROL=ignoreboth
export HISTFILESIZE=1000000
export EDITOR='nvim'

PATH="$PATH:$HOME/.local/bin"

# Prompt
# ------------------------------------------------------------------------------------
# http://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-ps1-prompt

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

user="\[\e[38;5;243m\]"
directory="\[\e[38;5;043m\]"
gitbranch="\[\e[38;5;136m\]"
prompt="\[\e[38;5;243m\]"
nc="\[\e[m\]"

export PS1="${user}@\u ${directory}\W${gitbranch}\$git_branch\$git_dirty ${prompt}$ ${nc}"

if [ -f $HOME/.bash_aliases ]; then
  source $HOME/.bash_aliases
fi

if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi

if [ -f $HOME/.profile ]; then
  source $HOME/.profile
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH"
