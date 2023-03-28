#!/bin/sh
#
# Set up the dot files in the appropate places in the users $HOME directory
#
set -xe

if [ ! -F "bashrc" ] ; then
    echo "Not executing setup.sh inll dot-files main directory!"
    exit 1
fi

# NOTE: MUST uee $PWD here so link works properly
echo "Linking files from $PWD into $HOME"
ln -fs $PWD/bash_profile $HOME/.bash_profile
ln -fs $PWD/bashrc $HOME/.bashrc
ln -fs $PWD/zshrc.zsh $HOME/.zshrc
ln -fs $PWD/gitconfig $HOME/.gitconfig
git config --global --add core.excludesfile $HOME/.gitignore_global
ln -fs $PWD/gitignore_global $HOME/.gitignore_global
# ln -fs $PWD/gradle.properties $HOME/.gradle.properties
# ln -fs $PWD/guard.rb $HOME/.guard.rb
ln -fs $PWD/hosts $HOME/.hosts
ln -fs $PWD/profile $HOME/.profile
ln -fs $PWD/zprofile $HOME/.zprofile
ln -fs $PWD/pryrc $HOME/.pryrc

# Get rid of these dirs before linking
mkdir -p $HOME/.old-dot-files
mv $HOME/.bashrc.d $HOME/.old-dot-files
ln -fs $PWD/bashrc.d $HOME/.bashrc.d
mv $HOME/.profile.d $HOME/.old-dot-files
ln -fs $PWD/profile.d $HOME/.profile.d
mv $HOME/.zprofile.d $HOME/.old-dot-files
ln -fs $PWD/zprofile.d $HOME/.zprofile.d

echo "Log out and log in again to ensure everything is in it's place."
