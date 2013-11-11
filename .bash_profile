# .bash_profile

if [ -x `which zsh` ]; then
  exec zsh
elif [ -f ~/.bashrc ]; then
  . ~/bashrc
fi
