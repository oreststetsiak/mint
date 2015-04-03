#!/bin/sh

#Script for git autocommit and push

COMMENT='Default comment'

while [ $# -gt 0 ]
do
  case "$1" in
    -m)
      COMMENT="$2"
      shift 2 # Discard option and it argument
    ;;
  esac
done

sudo git add .
sudo git commit -m "$COMMENT"
git push
