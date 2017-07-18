#!/usr/bin/env bash

# Installed from Homebrew in: /usr/local/opt/chruby/share/chruby/
if [ -n "$BASH_VERSION" ] || [ -n "$ZSN_VERSION" ]; then
    [ -f /usr/local/opt/chruby/share/chruby/chruby.sh ] && source /usr/local/opt/chruby/share/chruby/chruby.sh
    [ -f /usr/local/opt/chruby/share/chruby/auto.sh ] && source /usr/local/opt/chruby/share/chruby/auto.sh
fi
