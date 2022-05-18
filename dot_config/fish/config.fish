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
    abbr -a -g tp trash-put
    abbr -a -g tl trash-list
    abbr -a -g te trash-empty
    abbr -a -g tr trash-restore
end

# vim: ft=fish
