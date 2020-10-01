# Stuff for working with the Drip foundation tools

if [ -d $HOME/.drv ]; then
    export PATH=$PATH:$HOME/.drv/bin
    source $HOME/.drv/share/foundation-tools/bash_profile
else
    echo "No $HOME/.drv directory, not setting up or installing drip foundation tools"
fi
