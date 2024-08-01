# Path to your oh-my-zsh installation.

export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git asdf)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR="vim"

# PATH
# export HOMEBREW_PREFIX="/opt/homebrew"

export PATH="~/.bin:$PATH"

# Rancher
export PATH="~/.rd/bin:$PATH"

# oktaws
export PATH="~/.cargo/bin:$PATH"

# pnpm
export PATH="/Users/kscherling/Library/pnpm:$PATH"

# Add homebrew to path
# eval $(/opt/homebrew/bin/brew shellenv)

#asdf
# . $(brew --prefix asdf)/libexec/asdf.sh

# pnpm endexport REQUESTS_CA_BUNDLE=/Library/Application\ Support/Netskope/STAgent/download/nscacert_combined.pem

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/kscherling/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
