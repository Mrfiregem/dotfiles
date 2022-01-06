# Kanagawa color theme

set -l foreground 'DCD7BA'
set -l selection  '223249'
set -l comment    '727169'
set -l red        'c34043'
set -l orange     'ffa066'
set -l yellow     'e6c384'
set -l green      '98bb6c'
set -l purple     '957FB8'
set -l cyan       '7aa89f'
set -l pink       'D27E99'

# Syntax highlighting

set -g fish_color_normal         $foreground
set -g fish_color_command        $cyan
set -g fish_color_keyword        $pink
set -g fish_color_quote          $yellow
set -g fish_color_redirection    $foreground
set -g fish_color_end            $orange
set -g fish_color_error          $red
set -g fish_color_param          $purple
set -g fish_color_comment        $comment
set -g fish_color_selection      --background=$selection
set -g fish_color_search_match   --background=$selection
set -g fish_color_operator       $green
set -g fish_color_escape         $pink
set -g fish_color_autosuggestion $comment

# Completion menu

set -g fish_pager_color_progress    $comment
set -g fish_pager_color_prefix      $cyan
set -g fish_pager_color_completion  $foreground
set -g fish_pager_color_description $comment
