#!/bin/sh

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

link() {
  ln -fs $1 $2
  success "Linked $1 -> $2"
}

DOTFILES_ROOT=`cd $(dirname $0); pwd`

link $DOTFILES_ROOT/.screenrc, $HOME/.screenrc
link $DOTFILES_ROOT/.zshrc, $HOME/.zshrc
