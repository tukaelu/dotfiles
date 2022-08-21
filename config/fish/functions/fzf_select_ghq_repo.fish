function fzf_select_ghq_repo -d 'Navigate to the selected local repository'
  set local_repos_root (ghq root)
  set selected_repo ( \
    ghq list | \
    fzf \
      --query="$LBUFFER" \
      --layout=reverse \
      --header='Select local repository:' \
  )

  if [ -n "$selected_repo" ]
    builtin cd "$local_repos_root/$selected_repo"
    echo "$local_repos_root/$selected_repo"
  end
  commandline ''
  commandline -f repaint
end
