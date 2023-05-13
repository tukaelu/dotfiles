if type -q tmux
  alias t "tmux new-session -s (hostnamectl hostname)-(date +%s)"
end

export GPG_TTY=$(tty)

# deno
export DENO_INSTALL="/home/tuka/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
