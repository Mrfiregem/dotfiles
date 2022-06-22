if status is-interactive
    source ~/.config/fish/colorschemes/kanagawa.fish

    # Abbreviations
    abbr -a -g v $VISUAL

    abbr -a -g fpi 'flatpak install'
    abbr -a -g fpu flatpak-uninstall

    abbr -a -g tp trash-put
    abbr -a -g tl trash-list
    abbr -a -g te trash-empty
    abbr -a -g tt trash-restore

    abbr -a -g ls exa
    abbr -a -g ch chezmoi
    abbr -a -g lz lazygit
    abbr -a -g gd gallery-dl
    abbr -a -g tg topgrade
end

# vim: ft=fish
