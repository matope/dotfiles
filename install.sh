#!/bin/sh

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

ask_and_link() {
  ln -fsi $1 $2
#  /bin/echo -n "Make link $1 -> $2 ? [y/n]"
#  read ANS
#  if [ $ANS = 'y' -o $ANS = 'yes' ]; then
#    ln -fs $1 $2
#    success "Linked $1 -> $2"
#  fi
}

DOTFILES_ROOT=`cd $(dirname $0); pwd`
git submodule init
git submodule foreach 'git pull origin master'
git submodule update

ask_and_link $DOTFILES_ROOT/.bash_profile $HOME/.bash_profile
ask_and_link $DOTFILES_ROOT/.screenrc $HOME/.screenrc
ask_and_link $DOTFILES_ROOT/.zshrc $HOME/.zshrc

ask_and_link $DOTFILES_ROOT/.tmux.conf $HOME/.tmux.conf
ask_and_link $DOTFILES_ROOT/.tmux-powerlinerc $HOME/.tmux-powerlinerc
ask_and_link $DOTFILES_ROOT/.tmux.d $HOME/.tmux.d

success "Install successfully done."

exit 0
