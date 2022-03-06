if status is-interactive
  source ~/.config/fish/colorschemes/kanagawa.fish
end

# Abbreviations
#-- Editor
if set -q VISUAL
  abbr -a -g v $VISUAL
else
  abbr -a -g v nvim
end

#-- Other Programs
abbr -a -g ls exa
abbr -a -g ch chezmoi
abbr -a -g lz lazygit
abbr -a -g gd gallery-dl

#-- Trash-CLI
abbr -a -g gp garbage put
abbr -a -g gl garbage list
abbr -a -g ge garbage empty
abbr -a -g gr garbage restore

# vim: ft=fish
