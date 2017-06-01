#
# bash_profile
#

# Include aliases.
source ~/.alias;

# Add home directory bin.
export PATH="$HOME/bin:$PATH"

# Add GOPATH.
export GOPATH=$HOME/go

# Add GOBIN.
export GOBIN=$GOPATH/bin

# Add Go to PATH.
export PATH="$GOPATH/bin:$PATH:/usr/local/go/bin"

# Ignore immediate duplicate lines in bash history.
export HISTCONTROL=ignoredups

# If the OS is not OS X, apply these settings too.
if [[ `uname` != "Darwin" ]]; then
    # If not running interactively, don't do anything
    [[ $- != *i* ]] && return

    # Set display for terminal prompt.
    PS1='[\u@\h \W]\$ '

    # Make vim the default editor.
    export VISUAL=vim
    export EDITOR=vim

    # Make ls and grep colorful.
    export CLICOLOR=1
fi

# devkitPro config.
export DEVKITPRO="$HOME/devkitPro"
export DEVKITARM="$DEVKITPRO/devkitARM"
export PATH="$PATH:$DEVKITARM/bin"
