if type -q tmux
  alias t "tmux new-session -s (hostnamectl hostname)-(date +%s)"
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/tuka/Library/google-cloud-sdk/path.fish.inc' ]; . '/home/tuka/Library/google-cloud-sdk/path.fish.inc'; end

setxkbmap -option "ctrl:swapcaps"
