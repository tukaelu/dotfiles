function fzf_select_ghq_repo
  set local_repos_root (ghq root)
  set selected_repo (ghq list | fzf --query="$LBUFFER")

  if [ -n "$selected_repo" ]
    builtin cd "$local_repos_root/$selected_repo"
    echo "$local_repos_root/$selected_repo"
  end
  commandline ''
  commandline -f repaint
end
