status --is-interactive; and begin
  # Only add newline if previous command wasn't clear
  function postexec_newline --on-event fish_postexec
    contains -- $argv[1] clear || echo
  end
end
