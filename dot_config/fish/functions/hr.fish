function hr --description 'Displays a rule line'
if test -n "$COLUMNS"
set cols "$COLUMNS"
else
set cols (tput cols)
end
for arg in $argv
string repeat -n "$cols" -m "$cols" -- "$arg"
end
end
