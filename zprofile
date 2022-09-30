#!/bin/zsh
# ~/.zprofile: executed by the command interpreter for login shells.

export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

export ORGANIZATION="Tamara Temple Web Development"
export EDITOR='emacsclient'
export VISUAL=$EDITOR
export EMACS_ORG_PROTOCOL_PORT=9998
export HOMEBREW_INSTALL=/usr/local/Homebrew
eval "$($HOMEBREW_INSTALL/bin/brew shellenv)"

# For silencing wherefour system tests:
export MUTE_TEST_AUDIO=true

# Yields into env:
#  - HOMEBREW_CELLAR
#  - HOMEBREW_PREFIX
#  - HOMEBREW_REPOSITORY

# extra profile files
if [ -d ~/.zprofile.d ] ; then
  for s in $(find ~/.zprofile.d/ -type f | grep -v '~$') ; do
    [ -x "$s" ] && echo -n "Sourcing $s: "  && source "$s" && echo "done."
  done
fi
