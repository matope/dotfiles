#!/bin/sh

DOTFILES_ROOT=`cd $(dirname $0); pwd`

ln -siv  $DOTFILES_ROOT/.bash_profile     $HOME/bash_profile
ln -siv  $DOTFILES_ROOT/.zshrc            $HOME/zshrc
ln -siv  $DOTFILES_ROOT/.tmux.conf        $HOME/tmux.conf

if which git > /dev/null 2>&1; then
  git config --global include.path      $DOTFILES_ROOT/gitconfig
  git config --global core.excludesfile $DOTFILES_ROOT/gitignore_global
fi

echo "Install successfully done."
