# Source .shared_profile
[[ -f ~/.shared_profile ]] && source ~/.shared_profile

# Source .bashrc
[[ -f ~/.bashrc ]] && source ~/.bashrc

export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups

# ssh_auth_sock
if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock;
  echo "update SSH_AUTH_SOCK to $SSH_AUTH_SOCK"
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock;

#prompt with coloring hostname
export PS1="[\u@\[\033[32m\]\h\[\033[0m\] \W]\\$ "