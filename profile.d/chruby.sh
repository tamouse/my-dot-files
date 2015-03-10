#!/usr/bin/env bash

if [ -n "$BASH_VERSION" ] || [ -n "$ZSN_VERSION" ]; then
    [ -x /usr/local/share/chruby/chruby.sh ] && source /usr/local/share/chruby/chruby.sh
    [ -x /usr/local/share/chruby/auto.sh ] && source /usr/local/share/chruby/auto.sh
fi
