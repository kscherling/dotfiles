# Dot Files
# ------------------------------------------------------------------------------------

alias rebash='source ~/.bash_profile'
alias gobash='vim ~/.bash_profile'
alias gohosts='sudo vim /etc/hosts'

# Docker
# ------------------------------------------------------------------------------------

alias dc='docker-compose'
alias dcu='docker-compose up -d && docker-compose logs -f --tail=100'

# Git
# ------------------------------------------------------------------------------------

setup_git_hook() {
  cat << 'EOF' > .git/hooks/prepare-commit-msg
#!/bin/bash

BRANCH_NAME=$(git symbolic-ref --short HEAD)
ISSUE_NUM="${BRANCH_NAME##*/}"
BRANCH_IN_COMMIT=$(grep -c "\[$ISSUE_NUM\]" $1)

if [ -n "$ISSUE_NUM" ] && ! [[ $BRANCH_IN_COMMIT -ge 1 ]]; then
   sed -i.bak -e "/^\[/! s/^/[$ISSUE_NUM] /" $1
fi
EOF
  chmod +x .git/hooks/prepare-commit-msg
}

alias gs='git status'
alias gp='git pull'
alias gb='git branch'
alias gcm='git commit -m'
alias gpush='git push'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gadd='git add -p'
alias gprune='git branch --merged | grep -v "\*" | grep -v master | grep -v dev | xargs -n 1 git branch -d'
alias prep='chmod +x .git/hooks/prepare-commit-msg'

# Traversing
# ------------------------------------------------------------------------------------

cd() { builtin cd "$@"; ls; } # print files and directories on cd
alias ..='cd ../'
alias ~='cd ~'

# Paths
# ------------------------------------------------------------------------------------

alias path='echo $PATH | tr ":" "\n" | nl'
