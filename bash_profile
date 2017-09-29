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
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=$DEVKITPRO/devkitARM
export PATH=$PATH:$DEVKITARM/bin

# Add RISC-V tools to path.
export TOP=$HOME/tools
export RISCV=$TOP/riscv
export PATH=$PATH:$RISCV/bin

# Add Rust to path.
export PATH="$HOME/.cargo/bin:$PATH"

# Use 32-bit Wine
export WINEARCH="win32"
export WINEPREFIX="${HOME}/.wine"
# Disable winemenubuilder to keep Wine from creating new file associations
export WINEDLLOVERRIDES="winemenubuilder.exe=d"
