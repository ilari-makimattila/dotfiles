#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

link() {
  file="$1"
  dotfile="$DIR/dotfiles/$file"
  target="$HOME/$file"

  if [ -h "$target" ]
  then
      echo "'$target' already installed"
  elif [ -a "$target" ]
  then
      echo "'$target' exists, will not override"
  else
      echo "installing '$target'"
      ln -s "$dotfile" "$target"
  fi
}

for f in $(find "$DIR/dotfiles" -maxdepth 1 | tail -n +2)
do
    file=$(basename "$f")
    link "$file"
done

