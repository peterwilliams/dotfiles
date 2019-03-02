#!/bin/bash

# Setup Homebrew Cask

brew tap caskroom/cask

# Setup Auto-completion

brew install bash-completion

# Install Homebrew Apps

brew install diff-so-fancy
brew install dockutil
brew install ffmpeg
brew install git
brew install gpg
brew install node
brew install yarn
brew install youtube-dl

# Install Cask Apps

brew cask install 1password
brew cask install aerial
brew cask install alfred
brew cask install appcleaner
brew cask install audacity
brew cask install dropbox
brew cask install flux
brew cask install google-chrome
brew cask install handbrake
brew cask install nvalt
brew cask install spotify
brew cask install sublime-text
brew cask install the-unarchiver
brew cask install transmission
brew cask install vlc

# Install Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)

brew cask install qlcolorcode
brew cask install qlimagesize
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install quicklook-json
brew cask install quicklook-csv
