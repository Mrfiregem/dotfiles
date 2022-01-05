status is-interactive; or exit

# Change the colorscheme
source ~/.config/fish/colorschemes/tokyonight_storm.fish

# Abbreviations
#-- Editor
abbr -a -g v $VISUAL

#-- Other Programs
abbr -a -g ls exa
abbr -a -g ch chezmoi
abbr -a -g lz lazygit

#-- Trash-CLI
abbr -a -g tre 'yes | trash-empty'
abbr -a -g trl trash-list
abbr -a -g trm trash-rm
abbr -a -g trp trash-put
abbr -a -g trr trash-restore

# Path modification
fish_add_path -g $CARGO_HOME/bin
fish_add_path -g $HOME/.local/nimble/bin
fish_add_path -g $HOME/.local/bin
