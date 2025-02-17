#!/usr/bin/env zsh

# Install the deamon for the virtual HID device
gh release download -R "https://github.com/pqrs-org/Karabiner-DriverKit-VirtualHIDDevice.git" --pattern "*.pkg"
sudo installer -pkg Karabiner*.pkg -target /
rm Karabiner*.pkg
/Applications/.Karabiner-VirtualHIDDevice-Manager.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Manager activate

# Installation is being handled by mise
# cargo binstall kanata

# Install kanata tray
# gh release download -R "https://github.com/rszyma/kanata-tray.git" --pattern "*macos"
# sudo chmod +x kanata-tray-macos
# sudo chmod +x "$XDG_CONFIG_HOME/kanata/KanataTray/KanataTray"
# mkdir -p "/Applications/KanataTray.app/Contents/MacOS/"
# sudo cp -r "$XDG_CONFIG_HOME/kanata/KanataTray/" "/Applications/KanataTray.app/Contents/MacOS/"
# mv kanata-tray-macos "/Applications/KanataTray.app/Contents/MacOS/kanata-tray-macos"
# cp "$XDG_CONFIG_HOME/kanata/Info.plist" "/Applications/KanataTray.app/Contents/"
