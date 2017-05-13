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
mkdir -p $SAVE_DIR && \
  mv $HOME/.bash_profile $SAVE_DIR && \
  mv $HOME/.bashrc $SAVE_DIR && \
  mv $HOME/.bashrc.d  $SAVE_DIR && \
  mv $HOME/.gitconfig $SAVE_DIR && \
  mv $HOME/.gitignore_global $SAVE_DIR && \
  mv $HOME/.gradle.properties $SAVE_DIR && \
  mv $HOME/.profile $SAVE_DIR && \
  mv $HOME/.profile.d $SAVE_DIR && \
  mv $HOME/.railsrc $SAVE_DIR

set -e

echo "Linking files from $PWD into $HOME"
ln -fs $PWD/bash_profile $HOME/.bash_profile \
  && ln -fs $PWD/bashrc $HOME/.bashrc \
  && ln -fs $PWD/bashrc.d $HOME/.bashrc.d \
  && ln -fs $PWD/gitconfig $HOME/.gitconfig \
  && ln -fs $PWD/gitignore_global $HOME/.gitignore_global \
  && ln -fs $PWD/gradle.properties $HOME/.gradle.properties \
  && ln -fs $PWD/profile $HOME/.profile \
  && ln -fs $PWD/profile.d $HOME/.profile.d \
  && ln -fs $PWD/railsrc $HOME/.railsrc

echo "Log out and log in again to ensure everything is in it's place."
