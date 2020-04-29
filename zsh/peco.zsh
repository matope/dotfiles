function peco_select_history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER             # move cursor
    zle -R -c                   # refresh
}
setopt hist_ignore_all_dups
zle -N peco_select_history
bindkey '^R' peco_select_history

function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey '^@' peco-cdr

function peco-hostname() {
  local selected_hosts=$(cat ~/.ssh/known_hosts | awk -F'[ ,]+' '{print $1}' | peco)
  if [ -n "$selected_hosts" ]; then
      BUFFER="$BUFFER${selected_hosts}"
      # move cursor
      CURSOR=$#BUFFER
  fi
}

zle -N peco-hostname
bindkey '^H' peco-hostname

# git branch selection
function peco-git-branch() {
  local branch=$(git branch --sort=-authordate | tr -d '* ' | peco)
  BUFFER="$BUFFER${branch}"
  CURSOR=$#BUFFER
}
zle -N peco-git-branch
bindkey '^G' peco-git-branch

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src
