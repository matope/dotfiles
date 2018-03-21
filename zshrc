# users generic .zshrc file for zsh(1)

autoload -U promptinit
promptinit
prompt adam2

## Environment variable configuration
export LANG=ja_JP.UTF-8
export EDITOR=vim

# "cd" を省略可能
setopt auto_cd
# cd -[tab] で移動履歴に移動
setopt auto_pushd
# コマンドのスペルミスを指摘
setopt correct
# 補完候補をコンパクトに表示
setopt list_packed
# パス保管候補の末尾のスラッシュを省略しない
setopt noautoremoveslash
# 補完候補の表示時にbeepを鳴らさない
setopt nolistbeep


## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes 
#   to end of it)
#
bindkey -e

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
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


## Completion configuration
autoload -U compinit
compinit

## zsh editor
autoload zed


## Prediction configuration
#
#autoload predict-on
#predict-off


## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

alias where="command -v"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

## terminal configuration
#
unset LSCOLORS
case "${TERM}" in
xterm)
    export TERM=xterm-color
    ;;
kterm)
    export TERM=kterm-color
    # set BackSpace control character
    stty erase
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm*|screen-256color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    export LSCOLORS=gxfxcxdxbxegedabagacad
    export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
esac


## load user .zshrc configuration file
#
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine


# FROM .bashrc
export PATH=/opt/local/bin:/opt/local/sbin:~/bin:~/local/bin:~/bin:$PATH
export MANPATH=/opt/local/man:$MANPATH
export LD_LIBRARY_PATH=~/local/lib

if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null)
fi

# tmux
function chpwd() { ls }

# Golang
export PATH=$PATH:$HOME/go/bin:$GOROOT/bin

# Linuxbrew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"

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
      CURSOR=$#BUFFER             # move cursor
  fi
}

zle -N peco-hostname
bindkey '^H' peco-hostname

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
