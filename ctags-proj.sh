#!/bin/bash
if [ -f ".gitignore" ]; then
  touch tags
  ctags --languages='python' -R --exclude='.git' --exclude='node_modules' . || rm -rf tag || touch tags
else
  cd ..
  if [ "$PWD" = "$HOME" ]; then
    exit 0
  fi

  # Remove lock file it it's more than 4 seconds old
  if [ `find /tmp/tag.lock -mtime +4s | egrep '.*'` ]; then
      find /tmp/tag.lock -mtime +4s | xargs rm
  fi

  # If the lock exists, don't do anything
  if [ -f /tmp/tag.lock ]; then
      exit
  else
      touch /tmp/tag.lock
  fi

  exec "$0"

  rm -rf /tmp/tag.lock

fi
