#!/bin/sh

set -ex

if [ ! -x "$(command -v nvm)" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
  . ~/.bash_profile
fi

if [ ! -x "$(command -v npm)" ]; then
  nvm install --lts
fi

if [ ! -x "$(command -v yarn)" ]; then
  curl -o- -L https://yarnpkg.com/install.sh | bash
fi
