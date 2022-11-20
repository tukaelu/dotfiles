function fzf_select_history -d 'Select a command from history'
  set selected_cmd (history | fzf-tmux -p --layout=reverse)
  if [ -n "$selected_cmd" ]
    commandline $selected_cmd
  else
    commandline ''
  end
  commandline -f repaint
end
