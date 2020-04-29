function has() {
  command -v $1 >/dev/null 2>&1
}

if command -v hub >/dev/null 2>&1; then; 
  eval "$(hub alias -s)"
fi

if command -v direnv >/dev/null 2>&1; then; 
  eval "$(direnv hook zsh)"
fi;

# Load .zsh files under ~/.zsh directory.
ZSHHOME="${HOME}/.zsh"
if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

## load user .zshrc configuration file
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine
