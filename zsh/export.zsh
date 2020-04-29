export LANG=ja_JP.UTF-8
export EDITOR=vim

export PATH=$HOME/go/bin:$PATH
export PATH=/usr/local/go/bin:$PATH

export PATH=$HOME/.linuxbrew/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH

# lighter ls color.
case "${TERM}" in
kterm*|xterm*|screen-256color)
    export LSCOLORS=gxfxcxdxbxegedabagacad
    export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
esac

if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null)
fi
