function fzf_tmux_session -d 'Switch session'
  set selected_session ( \
    tmux list-sessions | \
    fzf-tmux \
      -p \
      --query="$LBUFFER" \
      --layout=reverse \
      --header="Switch session:" | \
    sed 's/:.*$//'
  )

  if [ -n "$selected_session" ]
    if [ -n "$TMUX" ]
      tmux switch-client -t $selected_session > /dev/null 2>&1
    else
      tmux attach -t $selected_session
    end
  end
end
