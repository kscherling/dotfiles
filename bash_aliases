##### GENERAL #####
alias grep='grep --color=auto'

##### EDITING #####
alias vim='nvim'

##### GIT #####
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

alias clear_local_branches='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

##### NODE #####
alias nombom='npm cache clear && bower cache clean && rm -rf node_modules bower_components && npm install && bower install'

if [ -f ~/.bash_aliases.local ]; then
  . ~/.bash_aliases.local
fi
