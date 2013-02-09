#!/bin/sh

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

ask_and_link() {
  /bin/echo -n "Make link $1 -> $2 ? [y/n]"
  read ANS
  if [ $ANS = 'y' -o $ANS = 'yes' ]; then
    ln -fs $1 $2
    success "Linked $1 -> $2"
  fi
}

DOTFILES_ROOT=`cd $(dirname $0); pwd`

ask_and_link $DOTFILES_ROOT/.screenrc $HOME/.screenrc
ask_and_link $DOTFILES_ROOT/.zshrc $HOME/.zshrc
ask_and_link $DOTFILES_ROOT/.tmux.com $HOME/.tmux.conf
