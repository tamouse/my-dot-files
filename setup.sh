#!/bin/sh
#
# Set up the dot files in the appropate places in the users $HOME directory
#

if [ ! -f "bashrc" ] ; then
    echo "Not executing setup.sh inll dot-files main directory!"
    exit 1
fi

# Backing up previous files
BACKUP_DIR="$HOME/.backup-dot-files-$(date '+%Y-%m-%d-%H-%M-%S')"
mkdir -p $BACKUP_DIR

SOURCE_FILES="$PWD/bash_profile $PWD/bashrc $PWD/zshrc $PWD/gitconfig $PWD/gitignore_global $PWD/hosts $PWD/profile $PWD/zprofile $PWD/pryrc"
SOURCE_DIRS="$PWD/bashrc.d $PWD/profile.d $PWD/shared.d $PWD/zprofile.d"

ROOT_FILES="$HOME/.bash_profile $HOME/.bashrc $HOME/.zshrc $HOME/.gitconfig $HOME/.gitignore_global $HOME/.hosts $HOME/.profile $HOME/.zprofile $HOME/.pryrc"
ROOT_DIRS="$HOME/.bashrc.d $HOME/.profile.d $HOME/.zprofile.d $HOME/.shared.d"

for f in $ROOT_FILES ; do
  touch "$f"
done
for d in $ROOT_DIRS ; do
  [ ! -d "$d" ] && mkdir -p "$d"
done

echo "removing old files"
for f in $ROOT_FILES ; do
  \cp -v "$f" "$BACKUP_DIR/$(basename $f)"
done

for d in $ROOT_DIRS ; do
  \cp -v -R "$d" "$BACKUP_DIR/$(basename $d)"
done

for f in $ROOT_FILES ; do
  \rm -v -f "$f"
done

for d in $ROOT_DIRS; do
  \rm -rfv "$d"
done

echo "Copying files and directories from $PWD into $HOME"

for f in $SOURCE_FILES ; do
  \cp -v "$f" "$HOME/.$(basename $f)"
done

for d in $SOURCE_DIRS ; do
  [ -d $d ] && \
    \mkdir -p "$HOME/.$(basename $d)" && \
    \cp -v "$d"/* "$HOME/.$(basename $d)/"
done

echo "Log out and log in again to ensure everything is in it's place."
