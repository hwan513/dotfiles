if status is-interactive; and not type -q fisher
  echo "Fisher not installed, installing..."
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
  fisher update
end
