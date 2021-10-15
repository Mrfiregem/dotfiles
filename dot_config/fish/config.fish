status is-interactive; or exit

# Change the colorscheme
source ~/.config/fish/colorschemes/tokyonight_storm.fish

# Abbreviations
#-- Editor
abbr -g v $VISUAL

#-- Other Programs
abbr -g ls exa

#-- Trash-CLI
abbr -g tre trash-empty
abbr -g trl trash-list
abbr -g trm trash-rm
abbr -g trp trash-put
abbr -g trr trash-restore

# Path modification
fish_add_path $HOME/.local/nimble/bin
fish_add_path $XDG_DATA_HOME/cargo/bin
fish_add_path $HOME/.local/bin

# SSH Agent
if status is-login
  eval (ssh-agent -c)
end
