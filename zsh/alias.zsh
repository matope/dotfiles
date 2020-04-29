alias where="command -v"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

# s3curl
alias s3curl="LC_ALL=C s3curl.pl"
