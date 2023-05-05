#!/bin/sh
set -x
DOTFILES_ROOT=$(cd $(dirname $0); pwd)
cd $DOTFILES_ROOT

ln -sv $DOTFILES_ROOT/.bash_profile   $HOME/.bash_profile
ln -sv $DOTFILES_ROOT/.bashrc         $HOME/.bashrc
ln -sv $DOTFILES_ROOT/.shared_profile $HOME/.shared_profile
ln -sv $DOTFILES_ROOT/.tmux.conf      $HOME/.tmux.conf
ln -sv $DOTFILES_ROOT/.zprofile       $HOME/.zprofile
ln -sv $DOTFILES_ROOT/.zshrc          $HOME/.zshrc
ln -sv $DOTFILES_ROOT/.zsh            $HOME/

if which git >/dev/null 2>&1; then
  git config --global include.path      $DOTFILES_ROOT/gitconfig
  git config --global core.excludesfile $DOTFILES_ROOT/gitignore_global
fi

echo "Install successfully done."
