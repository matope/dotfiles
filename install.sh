#!/bin/sh

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}


DOTFILES_ROOT=`cd $(dirname $0); pwd`
git submodule init
git submodule foreach 'git pull origin master'
git submodule update

ln -siv  $DOTFILES_ROOT/.bash_profile $HOME/.bash_profile
ln -siv  $DOTFILES_ROOT/.screenrc $HOME/.screenrc
ln -siv  $DOTFILES_ROOT/.zshrc $HOME/.zshrc

ln -siv  $DOTFILES_ROOT/.tmux.conf $HOME/.tmux.conf
ln -siv  $DOTFILES_ROOT/.tmux-powerlinerc $HOME/.tmux-powerlinerc
ln -siv  $DOTFILES_ROOT/.tmux.d $HOME/.tmux.d

success "Install successfully done."

exit 0
