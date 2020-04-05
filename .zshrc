# Autocompletion arrow keys
zstyle ':completion:*' menu select

# Ansi Colors in iTerm2
export CLICOLOR=1
# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Default editor
export EDITOR=/usr/local/bin/vim

# React-Native Android Stuff
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# force virtual environments for python
export PIP_REQUIRE_VIRTUALENV=true

# anaconda toggles
export PATH_OLD=$PATH
alias anaconda_on='export PATH="/Users/hamdi/anaconda3/bin:$PATH"'
alias anaconda_off='export PATH=$PATH_OLD'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hamdi/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/hamdi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hamdi/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/hamdi/google-cloud-sdk/completion.zsh.inc'; fi

# openssl module not found issue with django
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

# go lang
export GOPATH=/usr/local/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# gem
export GEM_HOME=~/.gem
export GEM_PATH=~/.gem
export PATH=$PATH:$GEM_PATH/bin
