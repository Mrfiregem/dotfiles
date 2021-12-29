#!/bin/sh
: "${IRIVER_DIR:=$(xdg-user-dir PICTURES)/iriver}"
if [ -z "$1" ]; then
  [ -d "${IRIVER_DIR}" ] || mkdir -p "${IRIVER_DIR}"
  outfile="${IRIVER_DIR}/$(date '+%FT%T%z').png"
else
  _base=$(dirname "$1")
  if [ -d "$_base" ]; then
    outfile=$1
  else
    printf '%s: error: Directory "%s" does not exist\n' "$0" "$_base" 1>&2
    exit 1
  fi
fi

grim -g "$(slurp)" "$outfile"
