# Stuff for working with the Drip foundation tools

if [ -d $HOME/.drv ]; then
    export PATH=$PATH:$HOME/.drv/bin
    source $HOME/.drv/share/foundation-tools/bash_profile

    # drip only akliases
    alias .d="pushd $HOME/Work/Drip/drip/"
    alias .drip="pushd $HOME/Work/Drip/drip/"
    alias .de="pushd $HOME/Work/Drip/drip-elm/"
    alias .dripelm="pushd $HOME/Work/Drip/drip-elm/"
    alias .dm="pushd $HOME/Work/Drip/drip-data-mart-etl/"
    alias .dmart="pushd $HOME/Work/Drip/drip-data-mart-etl/"

else
    echo "No $HOME/.drv directory, not setting up or installing drip foundation tools"
fi
