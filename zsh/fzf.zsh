[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

function fzf-cdr () {
  local selected_dir=$(cdr -l | awk '{ print $2 }' | fzf --preview 'f() { sh -c "CLICOLOR_FORCE=1 ls -AhFG1 $1" }; f {}')
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N fzf-cdr

bindkey '^@' fzf-cdr
