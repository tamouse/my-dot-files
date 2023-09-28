#!/bin/zsh
# ~/.zprofile: executed by the command interpreter for login shells.

export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export ORGANIZATION="Tamara Temple Web Development"
export EDITOR='emacsclient'
export VISUAL=$EDITOR

# Yields into env:
#  - HOMEBREW_CELLAR
#  - HOMEBREW_PREFIX
#  - HOMEBREW_REPOSITORY
[ -d "/opt/homebrew/Cellar" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
[ -d "/usr/local/Cellar" ] && eval "$(/usr/local/bin/brew shellenv)"

# extra profile files
if [ -d ~/.zprofile.d ] ; then
  for s in $(find ~/.zprofile.d/ -type f | grep -v '~$') ; do
    [ -x "$s" ] && source "$s"
  done
fi

if [ -d ~/.shared.d ] ; then
  for s in $(find ~/.shared.d/ -type f | grep -v '~$') ; do
    [ -x "$s" ] && source "$s"
  done
fi

[ -x "$HOME/.local_profile" ] && source "$HOME/.local_profile"


# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
