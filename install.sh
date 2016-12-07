#!/bin/sh

DOTFILES_ROOT=`cd $(dirname $0); pwd`

#======
# bash
#======
ln -siv  $DOTFILES_ROOT/.bash_profile     $HOME/.bash_profile

#======
# screen (deactivated)
#======
# ln -siv  $DOTFILES_ROOT/.screenrc         $HOME/.screenrc

#======
# zsh
#======
ln -siv  $DOTFILES_ROOT/.zshrc            $HOME/.zshrc

#======
# tmux
#======
ln -siv  $DOTFILES_ROOT/.tmux.conf        $HOME/.tmux.conf

#======
# git
#======
if which git > /dev/null 2>&1; then
  git config --global include.path      $DOTFILES_ROOT/gitconfig
  git config --global core.excludesfile $DOTFILES_ROOT/gitignore_global
fi

#======
# homebrew
#======
#sh $DOTFILES_ROOT/Brewfile.sh

echo "Install successfully done."

exit 0
