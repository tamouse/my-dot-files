# Drip foundation tools setup.

if [ -d $HOME/.drv ] ; then
    export DRV_HOME=$HOME/.drv
    source $DRV_HOME/bin/bash_profile
    export PATH=$PATH:$DRV_HOME/bin
    source $DRV_HOME/share/foundation-tools/bash_profile
    
    drinit -i d
else
    unset DRV_HOME
fi

