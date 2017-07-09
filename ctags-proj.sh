#!/bin/bash
if [ -f ".gitignore" ]; then
  ctags --languages='python' -R --exclude='.git' --exclude='node_modules' .
else
  cd ..
  if [ "$PWD" = "$HOME" ]; then
    echo "Got to '$HOME' have not found your project root, abort!"
    exit 1
  fi
  exec "$0"
fi
# EOF
