#!/bin/sh

set -e

if [ ! -x "$(command -v pyenv)" ]; then
  if [ ! -x "$(command -v brew)" ]; then
    echo "Don't know how to install PyEnv without Homebrew"
    exit 1
  fi

  brew update
  brew install pyenv
fi

if [ ! -x "$(command -v python2)" ]; then
  pyenv install 2.7.16
fi

PYTHON3_VERSION="3.7.3"
if [ ! -x "$(command -v python3)" ]; then
  pyenv install $PYTHON3_VERSION
fi

pyenv global $PYTHON3_VERSION
