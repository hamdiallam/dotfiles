# Autocompletion arrow keys
zstyle ':completion:*' menu select
autoload -Uz compinit && compinit

# Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Default editor. Use macvim if available & set alias' for them
editor=/usr/local/bin/vim
if [ -x '/usr/local/bin/mvim' ]; then
    editor=/usr/local/bin/mvim
    alias vim='mvim -v'
    alias vi='mvim -v'
fi
export EDITOR=$editor

# React-Native Android Stuff
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

# force virtual environments for python
export PIP_REQUIRE_VIRTUALENV=true

# anaconda toggles
export PATH_OLD=$PATH
alias anaconda_on='export PATH="/Users/hamdi/anaconda3/bin:$PATH"'
alias anaconda_off='export PATH=$PATH_OLD'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hamdi/google-cloud-sdk/path.zsh.inc' ]; then
    source '/Users/hamdi/google-cloud-sdk/path.zsh.inc';
fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hamdi/google-cloud-sdk/completion.zsh.inc' ]; then
    source '/Users/hamdi/google-cloud-sdk/completion.zsh.inc';
fi

# openssl module not found issue with django
export LIBRARY_PATH=/usr/local/opt/openssl/lib:$LIBRARY_PATH

# ruby/gem
export RUBY_PATH=/opt/homebrew/opt/ruby
export GEM_PATH=/opt/homebrew/lib/ruby/gems/3.4.0
export PATH=$RUBY_PATH/bin:$GEM_PATH/bin:$PATH

export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

# pyenv init when starting the shell
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)";
fi

# Homewbrew binaries
eval "$(/opt/homebrew/bin/brew shellenv)"

# nvm (installed via homebrew)
export NVM_DIR=$HOME/.nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# Created by `pipx` on 2025-11-12 16:42:42
export PATH="$PATH:/Users/hamdi/.local/bin"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

# Rust
. "$HOME/.cargo/env"

