function fish_right_prompt -d "Write the right-side prompt"
  # Color-coded Git changes - form is "2|8+|3-"
  if git_is_repo
    if test -z (git diff-index --shortstat HEAD 2>/dev/null)
      return
    end
    set -l git_changes (git diff-index --shortstat HEAD  2>/dev/null | grep -o '[0-9]\{1,\} file' | cut -d' ' -f1)
    set -l git_additions (git diff-index --shortstat HEAD  2>/dev/null | grep -o '[0-9]\{1,\} insertion' | cut -d' ' -f1)
    set -l git_deletions (git diff-index --shortstat HEAD  2>/dev/null | grep -o '[0-9]\{1,\} deletion' | cut -d' ' -f1)
    set_color AAA
    echo -n $git_changes
    if not test -z $git_additions
      set_color 555; echo -n '|'
      set_color green
      echo -n $git_additions'+'
    end
    if not test -z $git_deletions
      set_color 555; echo -n '|'
      set_color red
      echo -n $git_deletions'-'
    end
    set_color normal
  end
end
