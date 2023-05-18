#!/bin/zsh
# ~/.zprofile: executed by the command interpreter for login shells.

export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export ORGANIZATION="M-RETS"
export EMAIL="tamara@mrets.org"
export MAIL="$EMAIL"
export EDITOR='emacsclient'
export VISUAL=$EDITOR
export HOMEBREW_INSTALL=/opt/homebrew
eval "$($HOMEBREW_INSTALL/bin/brew shellenv)"

# Yields into env:
#  - HOMEBREW_CELLAR
#  - HOMEBREW_PREFIX
#  - HOMEBREW_REPOSITORY

# extra profile files
if [ -d ~/.zprofile.d ] ; then
  for s in $(find ~/.zprofile.d/ -type f | grep -v '~$') ; do
    [ -x "$s" ] && source "$s"
  done
fi
