#!/bin/bash

# set up virtualenvwrapper for python3
export WORKON_HOME=~/Envs
export VIRTUALENVWRAPPER_PYTHON=`which python3`
[ -x /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh
