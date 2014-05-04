#!/bin/sh

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}


DOTFILES_ROOT=`cd $(dirname $0); pwd`
git submodule init
git submodule foreach 'git pull origin master'
git submodule update

ln -siv  $DOTFILES_ROOT/.bash_profile     $HOME/.bash_profile

ln -siv  $DOTFILES_ROOT/.screenrc         $HOME/.screenrc

ln -siv  $DOTFILES_ROOT/.zshrc            $HOME/.zshrc

ln -siv  $DOTFILES_ROOT/.gitconfig.common $HOME/.gitconfig.common
ln -siv  $DOTFILES_ROOT/.gitignore.global $HOME/.gitignore.global
if which git > /dev/null 2>&1; then
  git config --global include.path      ~/.gitconfig.common
  git config --global core.excludesfile ~/.gitignore.global
fi

ln -siv  $DOTFILES_ROOT/.tmux.conf        $HOME/.tmux.conf
ln -siv  $DOTFILES_ROOT/.tmux-powerlinerc $HOME/.tmux-powerlinerc
ln -siv  $DOTFILES_ROOT/.tmux.d           $HOME/.tmux.d

brew bundle
success "Install successfully done."

exit 0
