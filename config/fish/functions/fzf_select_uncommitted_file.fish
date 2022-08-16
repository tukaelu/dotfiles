function fzf_select_uncommitted_file
  git status > /dev/null 2>&1
  if test $status -ne 0
    return 0
  end

  set selected_file (git status --short | awk '{print $2}' | fzf --layout=reverse)

  if [ -n "$selected_file" ]
    commandline -a $selected_file
  end
  commandline -f repaint
end
