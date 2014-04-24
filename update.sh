#!/bin/bash

DOTFILES_DIR=~/.dotfiles
TARGET_DIR=~
IGNORE_FILES=(".git" ".gitignore" "*.swp")

contains()
{
  local e
  for e in "${@:2}"; do [[ "$1" == $e ]] && return 0; done
  return 1
}

pushd $DOTFILES_DIR > /dev/null

for f in .*; do
  ([[ "$f" == "." ]] || [[ "$f" == ".." ]]) && continue

  if contains $f ${IGNORE_FILES[@]}; then
    echo "Ignorig '$f' ..."
    continue
  fi

  LN_SOURCE=${DOTFILES_DIR}/$f
  LN_TARGET=${TARGET_DIR}/$f
  echo "Link from $LN_SOURCE -> $LN_TARGET"
done

popd > /dev/null
