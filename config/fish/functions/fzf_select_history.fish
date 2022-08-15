function fzf_select_history
  history | fzf | read cmd
  if [ -n "$cmd"]
    commandline $cmd
  else
    commandline ''
  end
end
