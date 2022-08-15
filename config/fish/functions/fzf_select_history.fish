function fzf_select_history
  history | fzf --layout=reverse | read cmd
  if [ -n "$cmd" ]
    commandline $cmd
  else
    commandline ''
  end
end
