# Local settings for this machine: RL1452US.local

if [ -d $HOME/Library/Android/sdk ] ; then
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH=$PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
fi

# Fire up the multiple tabs in iterm for the current kickserv project
alias itabs='bin/rake itabs'
