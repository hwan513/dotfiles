#!/usr/bin/env zsh

if command -v ~/.local/share/mise/shims/kanata >/dev/null; then
  kanata_path=~/.local/share/mise/shims/kanata
elif command -v ~/.cargo/bin/kanata >/dev/null; then
  kanata_path=~/.cargo/bin/kanata
else
  echo "kanata not found in mise or cargo"
  exit 1
fi

sudo '/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/Applications/Karabiner-VirtualHIDDevice-Daemon.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Daemon' &
sudo $kanata_path -c ~/.config/kanata/main.kbd --port 5829
