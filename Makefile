# This Makefile helps set up a development environment by symlinking configuration files

# Ensure all commands in a target are run in a single shell
.ONESHELL:

.PHONY: install install-vim
# 
install:
	ln -sf $(PWD)/.bash_profile   $(HOME)/.bash_profile
	ln -sf $(PWD)/.bashrc         $(HOME)/.bashrc
	ln -sf $(PWD)/.shared_profile $(HOME)/.shared_profile
	mkdir -p $(HOME)/.config
	ln -sf $(PWD)/git             $(HOME)/.config/
	ln -sf $(PWD)/tmux            $(HOME)/.config/
	mkdir -p $(HOME)/.zsh
	ln -sf $(PWD)/.zshenv         $(HOME)/.zshenv
	ln -sf $(PWD)/zsh/.zprofile   $(HOME)/.zsh/.zprofile
	ln -sf $(PWD)/zsh/.zshrc      $(HOME)/.zsh/.zshrc
	ln -sf $(PWD)/zsh/completion  $(HOME)/.zsh/
	ln -sf $(PWD)/zsh/conf.d      $(HOME)/.zsh/

install-vim:
	ln -sf $(PWD)/.vimrc        $(HOME)/.vimrc
	mkdir -p $(HOME)/.vim
	ln -sf $(PWD)/vim/conf      $(HOME)/.vim/
	ln -sf $(PWD)/vim/templates $(HOME)/.vim/
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +":PlugInstall" +":GoInstallBinaries" +:q +:q
