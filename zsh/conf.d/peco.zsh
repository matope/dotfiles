
#
# peco + history : 最近のコマンド履歴を再実行
#
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
# bindkey '^R' peco_select_history


#
# peco + cdr (for zsh): 最近使ったディレクトリに戻る
#
function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
# bindkey '^@' peco-cdr

#
# peco + known_hosts : 最近使ったホストを表示
#
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

#
# peco + git : gitブランチを表示
#
function peco-git-branch() {
  local branch=$(git branch --sort=-authordate | tr -d '* ' | peco)
  BUFFER="$BUFFER${branch}"
  CURSOR=$#BUFFER
}
zle -N peco-git-branch
bindkey '^G' peco-git-branch


#
# peco + ghq : ghqリポジトリに移動
#
function peco-ghq() {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-ghq
bindkey '^]' peco-ghq
