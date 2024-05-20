#!/bin/bash

function ask() {
    read -p "$1 [Y/n]: " resp
    response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]')
    [[ "$response_lc" = "y" ]] || [[ -z "$response_lc" ]]
}

echo "Shell setup..."
./setup-shell.sh

SH=$(echo $SHELL | awk -F/ '{ print $NF }')
SHRC="$HOME/.$(echo $SH)rc"

echo "Sourcing shell/ scripts for $SHRC file..."
echo >> $SHRC
for file in shell/*; do
    if [ -f "$file" ]; then
        echo "source $(realpath "$file")" >> "$SHRC"
    fi
done

if ask "Do you want to configure tmux?"; then
    ./tmux/configure.sh $SHRC
fi
