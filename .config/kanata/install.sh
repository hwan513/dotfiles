#!/usr/bin/env zsh

# Install the deamon for the virtual HID device
gh release download -R "https://github.com/pqrs-org/Karabiner-DriverKit-VirtualHIDDevice.git" --pattern "*.pkg"
sudo installer -pkg Karabiner*.pkg -target /
rm Karabiner*.pkg
/Applications/.Karabiner-VirtualHIDDevice-Manager.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Manager activate

# Assume kanata is installed by mise, otherwise install using cargo
if ! command -v mise 2>&1 >/dev/null; then
  cargo install kanata
fi

# Copy over launchd plist file
cp $XDG_CONFIG_HOME/kanata/jtroo.kanata.plist ~/Library/LaunchAgents/

# helpful commands for launchd
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/jtroo.kanata.plist # load the launcd plist
# launchctl kickstart -k -p gui/$(id -u)/jtroo.kanata # manually restart the daemon
# launchctl list | grep jtroo.kanata # check if the daemon is running
