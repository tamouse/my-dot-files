#!/bin/sh 
#
# Set up the dot files in the appropate places in the users $HOME directory
#

if [ ! -F "bashrc"] ; then
  echo "Not executing in  dot-files main directory!"
  exit 1
fi 

set -x 

mkdir -p $HOME/.old-dot-files
mv $HOME/.bash_profile $HOME/.bashrc $HOME/.bashrc.d $HOME/.emacs $HOME/.emacs.d $HOME/.gem $HOME/.gitconfig $HOME/.gitignore_global $HOME/.profile $HOME/.old-dot-files
ln -fs bash_profile $HOME/.bash_profile
ln -fs bashrc $HOME/.bashrc
ln -fs bashrd.d $HOME/.bashrc.d
ln -fs emacs.d $HOME/.emacs.d
ln -fs gem $HOME/.gem
ln -fs gitconfig $HOME/.gitconfig
ln -fs gitignore_global $HOME/.gitignore_global
ln -fs profile $HOME/.profile

echo "Log out and log in again to ensure everything is in it's place."
