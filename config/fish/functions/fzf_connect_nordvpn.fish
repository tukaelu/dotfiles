
function fzf_connect_nordvpn -d 'Select a destination to connect to Nordvpn'

  set selected_country ( \
    nordvpn countries |\
    tail -n +2 |\
    xargs -n1 |\
    grep -Ev - |\
    fzf --header "Select country:" \
  )

  if [ -z "$selected_country" ]
    commandline -f repaint
    return
  end

  set selected_city ( \
    nordvpn cities $selected_country |\
    tail -n +2 |\
    xargs -n1 |\
    grep -Ev - |\
    fzf --header "Select city:" \
  )

  if [ -z "$selected_city" ]
    commandline -f repaint
    return
  end

  echo "nordvpn: connect to $selected_city/$selected_country"

  nordvpn connect $selected_country $selected_city

end
