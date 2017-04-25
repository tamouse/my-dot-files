#!/bin/bash
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

export ORGANIZATION="Tamara Temple Web Development"
export EDITOR='emacsclient'
export VISUAL=$EDITOR

export ANDROID_HOME=$HOME/Library/Android/sdk
export EMACS_ORG_PROTOCOL_PORT=9998

# extra profile files
if [ -d ~/.profile.d ] ; then
    for s in $(find ~/.profile.d/ -type f | grep -v '~$') ; do
        [ -x "$s" ] && source "$s"
    done
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
