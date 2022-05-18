if status is-login
    set -l vars (/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator |
      sed 's/^\(.*\)=\(.*\)$/set -gx \1 \2/')

    for var in $vars
        eval $var
    end
end
