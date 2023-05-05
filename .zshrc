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

#alias vim=nvim


# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/php@7.3/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/sbin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"

alias ding='terminal-notifier -title "Terminal" -message "Done with task. Exit status: $?" -sound default -activate -activate com.apple.Terminal; tput bel;'

export RPROMPT=$RPROMPT" %F{green}(`uname -m`)%f"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
