#!/usr/bin/env fish

set pkgs (pacman -Q | wc -l)
set upds (checkupdates | wc -l)

printf 'pkgcount|int|%d\n'   $pkgs
printf 'updcount|int|%d\n\n' $upds
