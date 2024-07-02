#!/usr/bin/env zsh

# Install the deamon for the virtual HID device
gh release download -R "https://github.com/pqrs-org/Karabiner-DriverKit-VirtualHIDDevice.git" --pattern "*.pkg"
sudo installer -pkg Karabiner*.pkg -target /
rm Karabiner*.pkg
/Applications/.Karabiner-VirtualHIDDevice-Manager.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Manager activate

# Install the kanata binary (requires cargo to be setup with binstall)
cargo binstall kanata

# Install kanata tray
gh release download -R "https://github.com/rszyma/kanata-tray.git" --pattern "*macos"
sudo chmod +x kanata-tray-macos
sudo chmod +x "Kanata Tray"
mkdir -p "/Applications/Kanata Tray.app/Contents/MacOS/"
sudo cp -r $XDG_CONFIG_HOME/kanata/ "/Applications/Kanata Tray.app/Contents/MacOS/"
rm kanata-tray-macos
