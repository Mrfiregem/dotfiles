function hexcol --description 'Take a 3/6 hex color and show it in stdout' --argument hex
  if not math "0x$hex" >/dev/null 2>&1
    echo "Unable to set color $hex" >&2
    return 1
  end
  if test (string length $hex) -eq 3
    set hex (string replace -r '(.)(.)(.)' '${1}${1}${2}${2}${3}${3}' $hex)
  else if test (string length $hex) -ne 6
    echo 'Hex code must be 6 or 3 characters long'
    return 1
  end
  set red (string sub -s 1 -l 2 $hex)
  set gre (string sub -s 3 -l 2 $hex)
  set blu (string sub -s 5 -l 2 $hex)
  set decimal (math 0x$red) (math 0x$gre) (math 0x$blu)

  if test (math "($decimal[1]*0.299)+($decimal[2]*0.587)+($decimal[3]*0.114)") -gt 150
    set_color black -b $hex
  else
    set_color --bold normal -b $hex
  end

  echo $hex
end
