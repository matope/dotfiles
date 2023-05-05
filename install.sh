#!/bin/sh

DOTFILES_ROOT=$(cd $(dirname $0); pwd)
cd $DOTFILES_ROOT

ln -siv $DOTFILES_ROOT/.bash_profile   $HOME/.bash_profile
ln -siv $DOTFILES_ROOT/.bashrc         $HOME/.bashrc
ln -siv $DOTFILES_ROOT/.shared_profile $HOME/.shared_profile
ln -siv $DOTFILES_ROOT/.tmux.conf      $HOME/.tmux.conf
ln -siv $DOTFILES_ROOT/.zprofile       $HOME/.zprofile
ln -siv $DOTFILES_ROOT/.zshrc          $HOME/.zshrc
ln -siv $DOTFILES_ROOT/.zsh            $HOME/.zsh

if which git >/dev/null 2>&1; then
  git config --global include.path      $DOTFILES_ROOT/gitconfig
  git config --global core.excludesfile $DOTFILES_ROOT/gitignore_global
fi

echo "Install successfully done."
