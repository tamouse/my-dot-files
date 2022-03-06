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

# extra profile files
if [ -d ~/.zprofile.d ] ; then
  for s in $(find ~/.zprofile.d/ -type f | grep -v '~$') ; do
    [ -x "$s" ] && echo "Sourcing $s" && source "$s"
  done
fi

# if running bash
# if [ -n "$BASH_VERSION" ]; then
#   # include .bashrc if it exists
#   if [ -f "$HOME/.bashrc" ]; then
# 	  . "$HOME/.bashrc"
#   fi
# fi

# if [ -d "/usr/local/var/postgresql@9.6" ] ; then
#     export PGDATA=/usr/local/var/postgresql@9.6/
# fi


# Show if the zoom auto-opener is running
# lsof -i :19421


eval "$(/opt/homebrew/bin/brew shellenv)"
