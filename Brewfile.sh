#!/bin/sh

# リポジトリを追加
brew tap homebrew/binary
brew tap homebrew/dupes
brew tap homebrew/versions

# homebrew-caskのインストール
brew tap phinze/homebrew-cask
brew install brew-cask

# インストール
brew install vim --with-lua
brew install zsh-completions
brew install tmux
brew install reattach-to-user-namespace
brew install ack
brew install ag
brew install tree
brew install ctags
brew install ant
brew install libxml2
brew install watch
brew install tig
brew install hub

#brew tap peco/peco
brew install peco
# install node This should be install via pkg
