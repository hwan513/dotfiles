status is-interactive || exit
not type -q fisher || exit
echo "Fisher not installed, installing..."
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/791da644d33d392216f6b1a9b5fc1e470db6d7f2/functions/fisher.fish | source
fisher update
# apply tide configuration
tide configure --auto --style=Lean --prompt_colors='True color' --show_time='24-hour format' --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Compact --icons='Many icons' --transient=No
