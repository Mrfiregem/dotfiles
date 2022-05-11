set -x VISUAL nvim
set -x EDITOR $VISUAL
eval (ssh-agent -c)

if status is-interactive
    source ~/.config/fish/colorschemes/kanagawa.fish

    # Abbreviations
    #-- Editor
    abbr -a -g v $VISUAL

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
end

# vim: ft=fish
