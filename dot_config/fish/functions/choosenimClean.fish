function choosenimClean --description 'Uninstall all choosenim versions aside from current.'
    set -l vers (choosenim show --noColor | sed -n 's/[[:space:]]//g; /^Versions:$/,$!d; /^[0-9]/p')
    if set -q vers[1]
        echo 'Preparing to remove:' $vers
        for v in $vers
            printf 'Removing v%s\n' $v
            choosenim remove $v
        end
    else
        echo 'There are no old versions to remove' 1>&2
        return 1
    end
end
