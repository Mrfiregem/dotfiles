function choosenimClean --description 'Uninstall all choosenim versions aside from current.'
    set vers (choosenim show --noColor | sed -n 's/[[:space:]]//g; /^Versions:$/,$!d; /^[0-9]/p')
    if set -q vers[0]
        echo 'Preparing to remove:' $vers
        for v in $vers
            printf 'Removing v%s\n' $v
        end
    else
        echo 'There are no old versions to remove' 1>&2
        return 1
    end
    set -S vers
end
