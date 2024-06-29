#!/bin/bash
# Run this script to setup the config on a local machine

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle

# Set the global gitignore
git config --global core.excludesfile .gitignore_apple

# Link dotfiles to the home directory
stow .
