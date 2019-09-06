#!/bin/sh

currentdir=$(pwd)

if [ ! -f $HOME/.bash_profile ]; then
  echo "Linking bash profile"
  ln -s $currentdir/.bash_profile $HOME/.bash_profile
fi

if [ ! -f $HOME/.bash_aliases ]; then
  echo "Linking bash aliases"
  ln -s $currentdir/.bash_aliases $HOME/.bash_aliases
fi

if [ ! -f $HOME/.tmux.conf ]; then
  echo "Linking bash aliases"
  ln -s $currentdir/.tmux.conf $HOME/.tmux.conf
fi

echo "Installing Node (NVM)..."
./scripts/setup_node.sh

source $HOME/.bash_profile
