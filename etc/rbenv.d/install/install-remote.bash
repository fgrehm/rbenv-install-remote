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
VERSION_NAME=${URL##*/}
VERSION_NAME=${VERSION_NAME%%\?*}

[[ -f $DOWNLOAD_PATH/$VERSION_NAME ]] && { echo "There is already a definition for $VERSION_NAME"; exit 1; }
wget $1 -O $DOWNLOAD_PATH/$VERSION_NAME

export DEFINITION=$DOWNLOAD_PATH/$VERSION_NAME
