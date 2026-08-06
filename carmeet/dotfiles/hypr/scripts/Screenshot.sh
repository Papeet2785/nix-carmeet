#!/usr/bin/env bash

set -e

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

FILE="$DIR/screenshot-$(date +"%Y-%m-%d_%H-%M-%S").png"

grim -g "$(slurp)" "$FILE"

swappy -f "$FILE"
