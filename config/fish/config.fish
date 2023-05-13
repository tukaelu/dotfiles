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
--color=spinner:#F8BD96,hl:#F28FAD
--color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96
--color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD
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
  alias tl "fzf_tmux_session"
  alias ide "tmux split-window -h -p 30; and tmux split-window -v -p 50"
end

# anyenv
set -Ux fish_user_paths $HOME/.anyenv/bin $fish_user_paths
if type -q anyenv
  status --is-interactive; and source (anyenv init - | psub)
end

# preparation by OS
switch (uname)
  case Darwin
    set LOCAL_CONF (dirname (status --current-filename))/config-macos.fish
  case Linux
    # start X at login
    if status --is-login
      and test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end

#    # disable touchpad middle click
#    xinput set-button-map "Synaptics TM3288-011" 1 0 3 4 5 6 7

    set LOCAL_CONF (dirname (status --current-filename))/config-linux.fish
end

if test -f $LOCAL_CONF
  source $LOCAL_CONF
end

#if type -q neofetch
#  neofetch
#end
