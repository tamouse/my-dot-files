#!/usr/bin/env bash

if [ -n "$BASH_VERSION" ] || [ -n "$ZSN_VERSION" ]; then
    source /usr/local/share/chruby/chruby.sh
    source /usr/local/share/chruby/auto.sh
fi
