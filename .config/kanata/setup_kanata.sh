#!/usr/bin/env zsh

# Exit early if kanata is not installed
if [[ -z $(which kanata) ]]; then
  echo "kanata is not installed"
  exit 1
fi

# Ensure that the kanata is executable
chmod +x =kanata

if [[ "$(uname)" == "Darwin" ]]; then
  # macOS specific configuration
  gh release download -R "https://github.com/pqrs-org/Karabiner-DriverKit-VirtualHIDDevice.git" --pattern "*.pkg"
  sudo installer -pkg Karabiner*.pkg -target /
  rm Karabiner*.pkg
  /Applications/.Karabiner-VirtualHIDDevice-Manager.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Manager activate

  # Copy over launchd plist file
  cp $XDG_CONFIG_HOME/kanata/jtroo.kanata.plist ~/Library/LaunchAgents/

  # helpful commands for launchd (currently not working properly, at least for macOS)
  # launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/jtroo.kanata.plist # load the launcd plist
  # launchctl kickstart -k -p gui/$(id -u)/jtroo.kanata # manually restart the daemon
  # launchctl list | grep jtroo.kanata # check if the daemon is running
fi
