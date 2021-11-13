#!/usr/bin/env bash
mapfile -t -n 2 out < <(curl -s 'wttr.in/?m&format=%x\n%t\n')

declare daytime
if [[ "$(date '+%H')" -le 18 ]]; then
  daytime='d'
else
  daytime='n'
fi

dayicon() {
  if [[ $daytime == 'd' ]]; then
    echo "$1"
  else
    echo "$2"
  fi
}

declare icon
case "${out[0]}" in
  'o')
    icon=$(dayicon '滛' '望')
    ;;
  'm')
    icon=$(dayicon '杖' '')
    ;;
  'mm')
    icon='摒'
    ;;
  'mmm')
    icon=''
    ;;
  '=')
    icon='敖'
    ;;
  '/' | '.')
    icon='殺'
    ;;
  '//' | '///')
    icon='歹'
    ;;
  '*' | '*/')
    icon='流'
    ;;
  '**' | '*/*')
    icon=''
    ;;
  'x' | 'x/')
    icon='晴'
    ;;
  '!/')
    icon=''
    ;;
  '*!*')
    icon=$(dayicon '' '')
    ;;
  '/!/')
    icon=$(dayicon '' '')
    ;;
  *)
    icon=''
    ;;
esac

printf 'icon|string|%s\n' "$icon"
printf 'weather|string|%s\n\n' "${out[1]}"
