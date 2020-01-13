#
# bash_profile
#

# Include local bash_profile and bashrc files if they exist.
if [ -f "$HOME/.bash_profile.local" ]; then
  source "$HOME/.bash_profile.local"
fi
if [ -f "$HOME/.bashrc.local" ]; then
  source "$HOME/.bashrc.local"
fi

# Include aliases.
source ~/.alias;

# Add home directory bin.
export PATH="$HOME/bin:$HOME/local/bin:$PATH"

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
    if [ -z "$PS1_IS_SET" ]; then
      PS1='[\u@\h \W]\$ '
    fi

    # Make vim the default editor.
    export VISUAL=nvim
    export EDITOR=nvim

    # Make ls and grep colorful.
    export CLICOLOR=1

    # Use GNOME keyring.
    if [ -n "$DESKTOP_SESSION" ] || [ "$DESKTOP_SESSION" = "i3" ] ; then
      export $(gnome-keyring-daemon -s)
    fi
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

# Disable .NET Core tools telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1
