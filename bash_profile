# Basic Settings
export PATH=$HOME/bin:$PATH

export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/lib
export CPATH=$CPATH:/usr/local/include

# Go
export PATH=$HOME/go/bin:/usr/local/go/bin:$PATH

# ElasticBeanstalk
export PATH=/Users/yasuharu/.ebcli-virtual-env/executables:$PATH

# Java
if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null)
fi

# # Python
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi

# pipenv
if [ -d $HOME/Library/Python/3.8/bin ]; then
  export PATH=$HOME/Library/Python/3.8/bin:$PATH
  export PIPENV_VENV_IN_PROJECT=true
fi

# Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"

# deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Setting PATH for Python 3.10
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.bash.inc' ]; then . '~/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/google-cloud-sdk/completion.bash.inc' ]; then . '~/google-cloud-sdk/completion.bash.inc'; fi

# ssh_auth_sock
if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock;
  echo "update SSH_AUTH_SOCK to $SSH_AUTH_SOCK"
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock;

[[ -f ~/.bashrc ]] && source ~/.bashrc
