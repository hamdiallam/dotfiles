# Autocompletion arrow keys
zstyle ':completion:*' menu select

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
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

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

# pyenv init when starting the shell
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)";
fi

# git branch in zsh prompt
function git_branch() {
    ## get the curent branch name
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
        echo :
    else
        echo ' ['$branch'] '
    fi
}
setopt prompt_subst # allow command substitution in the prompt
PROMPT='%~ $(git_branch) > ' # set the prompt value
