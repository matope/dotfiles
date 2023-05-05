# Source ~/.shared_profile
[[ -f ~/.shared_profile ]] && source ~/.shared_profile

export RPROMPT=$RPROMPT" %F{green}(`uname -m`)%f"