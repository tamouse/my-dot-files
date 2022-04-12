# Stuff for working with the Drip foundation tools

if [ -d $HOME/.drv ]; then
    export PATH=$PATH:$HOME/.drv/bin
    [ -f "$HOME/.drv/share/foundation-tools/bash_profile" ] && source $HOME/.drv/share/foundation-tools/bash_profile

    # drip only akliases
    alias .d="pushd $HOME/Work/Drip/drip/"
    alias .de="pushd $HOME/Work/Drip/drip-elm/"
    alias .dm="pushd $HOME/Work/Drip/drip-data-mart-etl/"
    alias .dmart="pushd $HOME/Work/Drip/drip-data-mart-etl/"
    alias .drip="pushd $HOME/Work/Drip/drip/"
    alias .dripelm="pushd $HOME/Work/Drip/drip-elm/"
    alias .dripships="pushd $HOME/Work/Drip/dripships.github.io/"
    alias .ds="pushd $HOME/Work/Drip/dripships.github.io/"
    alias .dui="pushd $HOME/Work/Drip/ui-components/"
    alias .dw="pushd $HOME/Work/Drip/drip.wiki/"
    alias .dx="pushd $HOME/Work/Drip/"

    alias .ca="pushd $HOME/Work/Drip/ConsAn/consumer-analytics/"
    alias .caw="pushd $HOME/Work/Drip/ConsAn/consumer-analytics.wiki/"

    # speed up drsh
    alias .neb="drsh -ra nebulous"
    alias .ro="drsh -ra readonly"

else
    echo "No $HOME/.drv directory, not setting up or installing drip foundation tools"
fi

# Drip docker reader
alias dc="docker-compose"
alias dcu="docker-compose up"
alias dcub="docker-compose up --build"
alias dce="docker-compose exec"
alias dcer="docker-compose exec reader"
alias dcerc="docker-compose exec reader bin/rails c"
alias dcert="docker-compose exec reader bin/rails test"
alias dcers="docker-compose exec reader /bin/sh"
alias dcr="docker-compose run"
