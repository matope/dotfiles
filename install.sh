#!/bin/sh
set -x

DOTFILES_ROOT=$(cd $(dirname $0); pwd)

ln -sv $DOTFILES_ROOT/.bash_profile   $HOME/.bash_profile
ln -sv $DOTFILES_ROOT/.bashrc         $HOME/.bashrc
ln -sv $DOTFILES_ROOT/.shared_profile $HOME/.shared_profile
ln -sv $DOTFILES_ROOT/git             $HOME/.config/
ln -sv $DOTFILES_ROOT/tmux            $HOME/.config/

# Symlink each files in .zsh instead of copying them.
mkdir -p $HOME/.zsh
ln -sv $DOTFILES_ROOT/.zshenv         $HOME/.zshenv
ln -sv $DOTFILES_ROOT/zsh/.zprofile   $HOME/.zsh/.zprofile
ln -sv $DOTFILES_ROOT/zsh/.zshrc      $HOME/.zsh/.zshrc
ln -sv $DOTFILES_ROOT/zsh/completion/ $HOME/.zsh
ln -sv $DOTFILES_ROOT/zsh/conf.d/     $HOME/.zsh
