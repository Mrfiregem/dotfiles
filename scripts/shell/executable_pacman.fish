#!/usr/bin/env fish

set pkgs (pacman -Q | wc -l)
printf 'pkgcount|int|%d\n'   $pkgs

set upds (checkupdates | wc -l)
printf 'updcount|int|%d\n\n' $upds
