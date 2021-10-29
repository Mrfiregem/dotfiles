#!/usr/bin/env bash
mapfile -t -n 2 out < <(curl -s 'wttr.in/?m&format=%x\n%t\n')

declare icon
case "${out[0]}" in
  'o')
    icon='滛'
    ;;
  'm')
    icon='杖'
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
    icon=''
    ;;
  '/!/')
    icon=''
    ;;
  *)
    icon=''
    ;;
esac

printf 'icon|string|%s\n' "$icon"
printf 'weather|string|%s\n\n' "${out[1]}"
