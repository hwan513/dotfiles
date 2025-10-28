#!/usr/bin/env zsh

kanata_path=$(echo =kanata)

# if there is no kanata in path
if [[ -z $kanata_path ]]; then
  exit 1
fi

if [[ "$(uname)" == "Darwin" ]]; then
  echo "macOS detected"
  sudo '/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/Applications/Karabiner-VirtualHIDDevice-Daemon.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Daemon' &
  sudo $kanata_path -c ~/.config/kanata/main.kbd --port 5829
elif [[ "$(uname)" == "Linux" ]]; then
  echo "Linux detected"
  sudo $kanata_path -c ~/.config/kanata/main.kbd --port 5829
else
  echo "$(uname) detected: no kanata configuration setup for this"
fi
