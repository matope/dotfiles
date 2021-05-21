# prompt
autoload -U promptinit
promptinit
prompt adam2
unsetopt promptcr
setopt transient_rprompt

# Basic settings
export LANG=ja_JP.UTF-8
export EDITOR=vim

# Keybind (emacs-like)
bindkey -e

# Enable zsh function 'url-quote-magic'.
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Go
export PATH=$HOME/go/bin:/usr/local/go/bin:$PATH

# ElasticBeanstalk
export PATH=/Users/yasuharu/.ebcli-virtual-env/executables:$PATH

# Linuxbrew
if [[ ${OSTYPE} == "linux"* ]]; then
  export PATH=$HOME/.linuxbrew/bin:$PATH
  export LD_LIBRARY_PATH=$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH
fi

# Java
if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null)
fi

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# ls
if [[ ${OSTYPE} == "linux"* ]]; then
  alias ls="ls --color"
elif [[ ${OSTYPE} == freebsd* || ${OSTYPE} == darwin*  ]] then
  alias ls="ls -G -w"
fi

# ls を明るく
case "${TERM}" in
kterm*|xterm*|screen-256color)
    export LSCOLORS=gxfxcxdxbxegedabagacad
    export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
esac

# hub
if command -v hub >/dev/null 2>&1; then; 
  eval "$(hub alias -s)"
fi

# direnv
if command -v direnv >/dev/null 2>&1; then; 
  eval "$(direnv hook zsh)"
fi;

# s3curl
alias s3curl="LC_ALL=C s3curl.pl"

# Load .zsh files under ~/.zsh directory.
for zshfile in ~/.zsh/*.zsh; do
  source ${zshfile}
done
