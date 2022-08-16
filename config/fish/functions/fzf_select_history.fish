function fzf_select_history
  set selected_cmd (history | fzf --layout=reverse)
  if [ -n "$selected_cmd" ]
    commandline $selected_cmd
  else
    commandline ''
  end
end
