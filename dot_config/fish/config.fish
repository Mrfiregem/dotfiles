status is-interactive; or exit

# Change the colorscheme
source ~/.config/fish/colorschemes/tokyonight_storm.fish

# Abbreviations
#-- Editor
abbr -g v $VISUAL

#-- Other Programs
abbr -g ls exa
abbr -g ch chezmoi

#-- Trash-CLI
abbr -g tre trash-empty
abbr -g trl trash-list
abbr -g trm trash-rm
abbr -g trp trash-put
abbr -g trr trash-restore

# Path modification
fish_add_path -g $HOME/.local/nimble/bin
fish_add_path -g $XDG_DATA_HOME/cargo/bin
fish_add_path -g $HOME/.local/bin
fish_add_path -g /usr/share/perl6/site/bin/
