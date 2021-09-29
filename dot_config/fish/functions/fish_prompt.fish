function fish_prompt -d 'Minimal prompt showing exitcode and cwd'
  set -l exitCode $status
  set -l dir (basename (prompt_pwd))
  set -l green (set_color --bold green)
  set -l clear (set_color normal)
  set -l red (set_color --bold red)

  echo -n $green"["

  if test $exitCode -eq 0
    echo -n "🗸 $clear"
  else
    echo -n $red"$exitCode $clear"
  end

  set_color normal
  echo -n "$dir$green]› $clear"
end
