if type -q tmux
  alias t "tmux new-session -s (hostnamectl hostname)-(date +%s)"
end
