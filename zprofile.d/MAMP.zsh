# -*- mode: shell-script -*-
# Add the MAMP bin paths to $PATH

if [ -d "/Applications/MAMP/" ] ; then
    export PATH="/Applications/MAMP/bin/php/php7.1.1/bin:/Applications/MAMP/Library/bin:$PATH"
fi
