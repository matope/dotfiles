# .bash_profile

if [ -e `which zsh` ]; then
  exec zsh
elif [ -f ~/.bashrc ]; then
  . ~/bashrc
fi
export LIBRARY_PATH+=":/usr/local/lib"
export CPATH+=":/usr/local/include"
