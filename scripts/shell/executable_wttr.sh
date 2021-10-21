#!/bin/sh

printf 'weather|string|%s\n\n' "$(curl -s 'wttr.in/?m&format=%c+%t')"
