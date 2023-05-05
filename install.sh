#!/bin/sh
set -x

ln -sv $DOTFILES_ROOT/.bash_profile   $HOME/.bash_profile
ln -sv $DOTFILES_ROOT/.bashrc         $HOME/.bashrc
ln -sv $DOTFILES_ROOT/.shared_profile $HOME/.shared_profile
ln -sv $DOTFILES_ROOT/.tmux.conf      $HOME/.tmux.conf
ln -sv $DOTFILES_ROOT/.zprofile       $HOME/.zprofile
ln -sv $DOTFILES_ROOT/.zshrc          $HOME/.zshrc
ln -sv $DOTFILES_ROOT/.zsh            $HOME/
ln -sv $DOTFILES_ROOT/git             $HOME/.config/