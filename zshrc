# users generic .zshrc file for zsh(1)

autoload -U promptinit
promptinit
prompt adam2

## Environment variable configuration
export LANG=ja_JP.UTF-8
export EDITOR=vim

setopt correct           # コマンドのスペルミスを指摘
setopt list_packed       # 補完候補をコンパクトに表示
setopt noautoremoveslash # パス保管候補の末尾のスラッシュを省略しない
setopt nolistbeep        # 補完候補の表示時にbeepを鳴らさない

bindkey -e # emacs like keybind.

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

## Command history configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups # history の重複を無視
setopt share_history    # コマンド履歴をターミナル間で共有

## Completion configuration
autoload -U compinit
compinit

# Alias configuration
# expand aliases before completing
# aliased ls needs if file/dir completions work
setopt complete_aliases

alias where="command -v"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

# lighter ls color.
case "${TERM}" in
kterm*|xterm*|screen-256color)
    export LSCOLORS=gxfxcxdxbxegedabagacad
    export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
esac


## load user .zshrc configuration file
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null)
fi

# ls after cd.
function chpwd() { ls }

# go
export PATH=$HOME/go/bin:/usr/local/go/bin:$PATH
export PATH=$HOME/.linuxbrew/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH

# url-quote-magic
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# cdr
autoload -Uz is-at-least
if is-at-least 4.3.11
then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':chpwd:*' recent-dirs-max 5000
  zstyle ':chpwd:*' recent-dirs-default yes
  zstyle ':completion:*' recent-dirs-insert both
fi

# peco
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

# vcs_info
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

# s3curl
alias s3curl="LC_ALL=C s3curl.pl"

function has() {
  command -v $1 >/dev/null 2>&1
}

if has hub; then
  eval "$(hub alias -s)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

if has direnv; then
  eval "$(direnv hook zsh)"
fi;
