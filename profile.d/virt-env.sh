#!/bin/bash

if [ -f /usr/local/bin/virtualenvwrapper.sh ] ; then
  # set up virtualenvwrapper for python3
  export WORKON_HOME=~/Envs
  export VIRTUALENVWRAPPER_PYTHON=`which python3`
  source /usr/local/bin/virtualenvwrapper.sh
fi
