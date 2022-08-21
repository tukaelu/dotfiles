function fkill
  set -l signal ''
  test -z $argv[1]
    or set signal $argv[1]

  set selected_pids (ps -ef | sed 1d | fzf -m | awk '{print $1}')

  if [ -n "$selected_pids" ]
    echo $selected_pids | xargs kill $signal
  end
  commandline -f repaint
end
