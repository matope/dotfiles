autoload -Uz add-zsh-hook
autoload -Uz vcs_info
setopt PROMPT_SUBST
zstyle ':vcs_info:*' formats '(%s)-[%b] %m'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
_vcs_precmd () { vcs_info }
add-zsh-hook precmd _vcs_precmd
RPROMPT='%F{green}${vcs_info_msg_0_}%f'
zstyle ':vcs_info:git+set-message:*' hooks git-config-user
function +vi-git-config-user(){
  hook_com[misc]+=`git config user.email`
}
