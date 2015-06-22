# .bash_profile

if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock;
  echo "update SSH_AUTH_SOCK to $SSH_AUTH_SOCK"
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock;

#PATH=~/.linuxbrew/bin:$PATH
if [ "`which zsh`" != "" ]; then
  exec zsh
fi
