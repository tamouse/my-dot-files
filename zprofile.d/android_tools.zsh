# -*- mode: shell-script -*-

: ${ANDROID_HOME:=$HOME/Library/Android/sdk}

# Assumes a symbolic link to the actual:
: ${JAVA_HOME:=/Library/Java/JavaVirtualMachines/jdk1.8/Contents/Home}

PATH="$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$JAVA_HOME/bin:$PATH"
export PATH
