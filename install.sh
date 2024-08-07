#!/bin/sh

currentdir=$(pwd)

echo 'Creating symbolic links...'

echo "Linking .zshrc -> $HOME/.zshrc"
ln -sf $currentdir/.zshrc $HOME/.zshrc

echo "Linking custom aliases -> $HOME/.zshrc"
ln -sf $currentdir/aliases.zsh $HOME/.oh-my-zsh/custom/aliases.zsh

echo "Linking .tmux.conf -> $HOME/.tmux.conf"
ln -sf $currentdir/.tmux.conf $HOME/.tmux.conf

echo "Linking tat script -> $HOME/.bin/tat"
mkdir -p $HOME/.bin
ln -sf $currentdir/bin/tat $HOME/.bin/tat

echo 'Done ✨'