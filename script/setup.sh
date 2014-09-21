#!/bin/sh 
#
# Set up the dot files in the appropate places in the users $HOME directory
#

if [ ! -F "bashrc"] ; then
  echo "Not executing in  dot-files main directory!"
  exit 1
fi 

set -x 

ln -fs bash_profile $HOME/.bash_profile
ln -fs bashrc $HOME/.bashrc
ln -fs bashrd.d $HOME/.bashrc.d
ln -fs emacs.d $HOME/.emacs.d
mv $HOME/.emacs $HOME/.emacs-file-not-used
ln -fs gem $HOME/.gem
ln -fs gitconfig $HOME/.gitconfig
ln -fs gitignoreall $HOME/.gitignoreall
ln -fs profile $HOME/.profile 

echo "Log out and log in again to ensure everything is in it's place."
