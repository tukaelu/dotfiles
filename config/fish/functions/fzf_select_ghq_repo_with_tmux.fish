function fzf_select_ghq_repo_with_tmux -d 'Navigate to the selected local repository'
  set local_repos_root (ghq root)
  set selected_repo ( \
    ghq list | \
    fzf-tmux \
      -p \
      --query="$LBUFFER" \
      --layout=reverse \
      --header='Select local repository:' \
  )

  if [ -n "$selected_repo" ]
    if [ -n "$TMUX" ]
      set repo_name (basename $selected_repo)
      tmux has $repo_name > /dev/null 2>&1
      if [ $status -ne 0 ]
        tmux new-session -d -c "$local_repos_root/$selected_repo" -s $repo_name > /dev/null 2>&1
      end
      tmux switch-client -t $repo_name > /dev/null 2>&1
    else
      builtin cd "$local_repos_root/$selected_repo"
      echo "$local_repos_root/$selected_repo"
    end
  end
  commandline ''
  commandline -f repaint
end
