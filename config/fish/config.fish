set fish_greeting ""

set -gx TERM xterm-256color
set -gx EDITOR nvim
set -gx FZF_DEFAULT_OPTS '
--reverse
--extended
--multi
--bind=ctrl-u:page-up
--bind=ctrl-d:page-down
--bind=ctrl-z:toggle-all
--color fg:#d8dee9,bg:#3b4252,hl:#ebcb8b,fg+:#d8dee9,bg+:#4c566a,hl+:#ebcb8b
--color info:#88c0d0,prompt:#a3be8c,spinner:#88c0d0,pointer:#5e81ac,marker:#bf616a
--height 40%
--border
'

# aliases
command -qv nvim && alias vi nvim
command -qv nvim && alias vim nvim

if type -q exa
  alias ll "exa -l -g --sort newest --icons"
end

if type -q tmux
  alias ide "tmux split-window -h -p 30; and tmux split-window -v -p 50"
end

# anyenv
status --is-interactive; and source (anyenv init - | psub)

# os
switch (uname)
  case Linux
    set LOCAL_CONF (dirname (status --current-filename))/config-linux.fish
  case Darwin
    set LOCAL_CONF (dirname (status --current-filename))/config-macos.fish
end

if test -f LOCAL_CONF
  source $LOCAL_CONF
end


switch (uname)
  case Linux
    # disable touchpad middle click
    xinput set-button-map "Synaptics TM3288-011" 1 0 3 4 5 6 7
end

# Start X at login
if status --is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end
