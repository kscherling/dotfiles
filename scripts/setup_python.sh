#!/bin/sh

set -e

if [ ! -x "$(command -v pyenv)" ]; then
  if [ -x "$(command -v brew)" ]; then
    brew update
    brew install pyenv
  else
    echo "Don't know how to install PyEnv without Homebrew"
  fi
fi
