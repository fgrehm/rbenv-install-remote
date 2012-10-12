#!/usr/bin/env bash

# The rbenv-install-remote plugin delegate for "rbenv install".

if ! $(echo "${ARGUMENTS[0]}" | grep -q '^https\?://'); then
  return
fi

if [ -z "$RBENV_ROOT" ]; then
  RBENV_ROOT="${HOME}/.rbenv"
fi

DOWNLOAD_PATH="$RBENV_ROOT/plugins/rbenv-install-remote/share/ruby-build-remote"
mkdir -p $DOWNLOAD_PATH

URL=${ARGUMENTS[0]}

if [ -z "${VERSION_NAME}" ]; then
  VERSION_NAME=${URL##*/}
  VERSION_NAME=${VERSION_NAME%%\?*}
fi

if [[ -f $DOWNLOAD_PATH/$VERSION_NAME ]]; then
  echo -n "There is already a downloaded definition for $VERSION_NAME, do you want to overwrite it? [Y/n] "
  read confirmation
  if ! ([ -n "${confirmation}" ] || ! [[ "${confirmation}" =~ 'y|Y' ]]); then
    echo "Aborting installation"
    exit 1
  else
    rm $DOWNLOAD_PATH/$VERSION_NAME
  fi
fi

wget $1 -O $DOWNLOAD_PATH/$VERSION_NAME

export DEFINITION=$DOWNLOAD_PATH/$VERSION_NAME
