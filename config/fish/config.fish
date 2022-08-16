set fish_greeting ""

set -gx TERM xterm-256color
set -gx EDITOR nvim

# aliases
command -qv nvim && alias vi nvim
command -qv nvim && alias vim nvim

if type -q exa
  alias ll "exa -l -g --sort newest --icons"
end

# os
switch (uname)
  case Linux
    set LOCAL_CONF (dirname (status --current-filename))/config-linux.fish
  case Darwin
    set LOCAL_CONF source (dirname (status --current-filename))/config-macos.fish
end

if test -f LOCAL_CONF
  source $LOCAL_CONF
end

