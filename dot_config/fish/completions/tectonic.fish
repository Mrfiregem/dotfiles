# Tectonic: Process (La)TeX documents

# Flags
complete -c tectonic -s h -l help -d 'Print help information'
complete -c tectonic -s k -l keep-intermediates -d 'Keep intermediate processing files'
complete -c tectonic -l keep-logs -d 'Keep generated log files'
complete -c tectonic -s C -l only-cached -d 'Use only locally cached resource files'
complete -c tectonic -s p -l print -d 'Print engine chatter during processing'
complete -c tectonic -l synctex -d 'Generate SyncTeX data'
complete -c tectonic -l untrusted -d 'Disable all known-insecure features'
complete -c tectonic -s V -l version -d 'Print version information'

# Options
complete -c tectonic -s r -l reruns -x -d 'Rerun the TeX engine <n> times after the first'
complete -c tectonic -l makefile-rules -r -d 'Write Makefile-format rules to <dest_path>'
complete -c tectonic -s b -l bundle -r -d 'Use diretory or bundle to find resources'
complete -c tectonic -l outfmt -x -d 'The kind of output to generate' -a 'pdf html xdv aux fmt'
complete -c tectonic -l hide -r -d 'Tell the engine no file at <hide_path> exists'
complete -c tectonic -s c -l chatter -x -d 'Level of chatter to print when running' -a 'default minimal'
complete -c tectonic -s Z -x -d 'Pass unstable options'
complete -c tectonic -s o -l outdir -r -d 'Directory to place output files'
complete -c tectonic -l pass -x -d 'Choose which engines to run' -a 'default tex bibtex_first'
complete -c tectonic -s f -l format -x -d 'The name of the engine "format" file' -a 'latex'
complete -c tectonic -s w -l web-bundle -x -d 'Use <url> to find resource files'
complete -c tectonic -l color -x -d 'Toggle colorful log output' -a 'always auto never'
