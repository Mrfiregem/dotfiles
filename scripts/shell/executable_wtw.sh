#!/bin/sh
# A wrapper around wtwitch

[ -n "$1" ] || {
  wtwitch
  exit 0
}

case "$1" in
  o | online)
    wtwitch c | cat -v | sed -n -e 's/\^\[\[[0-9]\+m//g' \
      -e 's/^[[:space:]]*//' \
      -e 's/: / -> /' \
      -e '/^Live channels:$/,/^$/{//!p}'
    exit 0
    ;;
  a | all)
    wtwitch c | cat -v | sed -n -e 's/\^\[\[[0-9]\+m//g' \
      -e '/Settings:$/,$d' \
      -e '/^[[:space:]]\{3\}/{s/.\{3\}//; s/[:,].*$//; p}' |
      sort
    exit 0
    ;;
  h | help)
    wtwitch h | sed -e '/^=> \[e\]/i'\\ \
      -e '=> [a]ll               - Print all subscriptions in machine-readable format.' \
      -e '/^=> \[e\]/i'\\ \
      -e '=> [o]nline            - Print all online streamers in machine-readable format.'
    exit 0
    ;;
  *)
    wtwitch "$@"
    exit 0
    ;;
esac
