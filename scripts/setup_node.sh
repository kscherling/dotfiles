#!/bin/sh

set -e

if [ ! -x "$(command -v nvm)" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
  . ~/.bash_profile
fi

if [ ! -x "$(command -v node)" ]; then
  nvm install --lts
fi
