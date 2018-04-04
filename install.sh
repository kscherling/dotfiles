#!/bin/sh

currentdir=$(pwd)

if [ ! -f $HOME/.bash_profile ]; then
  echo "Linking bash profile"
  ln -s $currentdir/bash_profile $HOME/.bash_profile
fi

if [ ! -f $HOME/.bash_aliases ]; then
  echo "Linking bash aliases"
  ln -s $currentdir/bash_aliases $HOME/.bash_aliases
fi

if [ ! -d $HOME/.ssh ] ||  [ ! -f $HOME/.ssh/id_rsa.pub ]; then
  echo "Generating ssh key..."
  ssh-keygen -t rsa -b 4096 -C "rick@ricksullivan.net"

  if eval "$(ssh-agent -s)" > /dev/null; then
    ssh-add $HOME/.ssh/id_rsa
  fi
fi

echo "Setting up neovim..."
./scripts/symlink_nvim_dotfiles.sh

echo "Setting up Vim Plug..."
./scripts/setup_vim_plug.sh

source $HOME/.bash_profile
