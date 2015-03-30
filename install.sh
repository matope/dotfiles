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
ln -siv  $DOTFILES_ROOT/.gitconfig.common $HOME/.gitconfig.common
if which git > /dev/null 2>&1; then
  git config --global include.path      ~/.gitconfig.common
fi

ln -siv  $DOTFILES_ROOT/.gitignore $HOME/.gitignore
if which git > /dev/null 2>&1; then
  git config --global core.excludesfile ~/.gitignore
fi

# 一旦はずす。
#ln -siv  $DOTFILES_ROOT/.git_template $HOME/.git_template
#if which git > /dev/null 2>&1; then
#  git config --global init.templatedir ~/.git_template
#fi


#======
# homebrew
#======
#sh $DOTFILES_ROOT/Brewfile.sh

echo "Install successfully done."

exit 0
