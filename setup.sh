#!/bin/sh
#
# Set up the dot files in the appropate places in the users $HOME directory
#

if [ ! -F "bashrc" ] ; then
    echo "Not executing in  dot-files main directory!"
    exit 1
fi

set -x

SAVE_DIR=$HOME/.old-dot-files-$(date "+%Y%m%d%H%M%S")
mkdir -p $SAVE_DIR
echo "Saving current files in $SAVE_DIR"
mv $HOME/.bash_profile \
   $HOME/.bashrc \
   $HOME/.bashrc.d \
   $HOME/.gitconfig \
   $HOME/.gitignore_global \
   $HOME/.gradle.properties \
   $HOME/.guard.rb \
   $HOME/.hosts \
   $HOME/.profile \
   $HOME/.profile.d \
   $HOME/.pryrc \
   $HOME/.railsrc \
   $SAVE_DIR

echo "Linking files from $PWD into $HOME"
set -e
ln -fs $PWD/bash_profile $HOME/.bash_profile
ln -fs $PWD/bashrc $HOME/.bashrc
ln -fs $PWD/bashrc.d $HOME/.bashrc.d
ln -fs $PWD/gitconfig $HOME/.gitconfig
ln -fs $PWD/gitignore_global $HOME/.gitignore_global
ln -fs $PWD/gradle.properties $HOME/.gradle.properties
ln -fs $PWD/guard.rb $HOME/.guard.rb
ln -fs $PWD/hosts $HOME/.hosts
ln -fs $PWD/profile $HOME/.profile
ln -fs $PWD/profile.d $HOME/.profile.d
ln -fs $PWD/pryrc $HOME/.pryrc

sed <$PWD/railsrc >$HOME/.railsrc -e "s|\$HOME|$HOME|g"

/bin/ls -dAl $HOME/.[a-zA-Z]*

echo "Log out and log in again to ensure everything is in it's place."
