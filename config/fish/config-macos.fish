if type -q tmux
  alias t "tmux new-session -s (hostname -s)-(date +%s)"
end
