#!/bin/bash

HOSTNAME=""

echo "---- Set computer name to $HOSTNAME (as done via System Preferences → Sharing)"
echo "Original value (ComputerName): '"`scutil --get ComputerName`"'"
echo "Original value (LocalHostName): '"`scutil --get LocalHostName`"'"
echo "Original value (HostName): '"`scutil --get HostName`"'"
echo "Original value (NetBIOSName): '"`defaults read /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName`"'"
# Friendly name shown in System Preferences > Sharing
sudo scutil --set ComputerName $HOSTNAME
# Bonjour name ending in .local
sudo scutil --set LocalHostName $HOSTNAME
# The name recognized by the hostname command
sudo scutil --set HostName $HOSTNAME
# Max of 15 characters
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $HOSTNAME

echo "---- Enable Secure Keyboard Entry in Terminal.app"
# See: https://security.stackexchange.com/a/47786/8918
echo "Original value: '"`defaults read com.apple.terminal SecureKeyboardEntry`"'"
defaults write com.apple.terminal SecureKeyboardEntry -bool true

echo "---- Save to disk (not to iCloud) by default"
echo "Original value: '"`defaults read NSGlobalDomain NSDocumentSaveNewDocumentsToCloud`"'"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo "---- Save screenshots to the Desktop"
echo "Original value: '"`defaults read com.apple.screencapture location`"'"
defaults write com.apple.screencapture location -string "$HOME/Desktop"

echo "---- Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)"
echo "Original value: '"`defaults read com.apple.screencapture type`"'"
defaults write com.apple.screencapture type -string "png"

echo "---- Disable screenshot thumbnail preview upon capture"
echo "Original value: '"`defaults read com.apple.screencapture show-thumbnail`"'"
defaults write com.apple.screencapture show-thumbnail -bool FALSE

echo "---- Avoid creating .DS_Store files on network volumes"
echo "Original value: '"`defaults read com.apple.desktopservices DSDontWriteNetworkStores`"'"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "---- Show the ~/Library folder"
chflags nohidden ~/Library

echo "---- Show all filename extensions"
echo "Original value: '"`defaults read NSGlobalDomain AppleShowAllExtensions`"'"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "---- Disable crash reporter"
echo "Original value: '"`defaults read com.apple.CrashReporter DialogType`"'"
defaults write com.apple.CrashReporter DialogType none

echo "---- Enable snap-to-grid for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

echo "---- Increase grid spacing for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 48" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 48" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 48" ~/Library/Preferences/com.apple.finder.plist

echo "---- Increase the size of icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist

echo "---- Finder: Set Desktop as the default location for new Finder windows"
# For other paths, use `PfLo` and `file:///full/path/here/`
echo "Original value: '"`defaults read com.apple.finder NewWindowTarget`"'"
echo "Original value: '"`defaults read com.apple.finder NewWindowTargetPath`"'"
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

echo "---- Finder: When performing a search, search the current folder by default"
echo "Original value: '"`defaults read com.apple.finder FXDefaultSearchScope`"'"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "---- Finder: Use List View by default"
echo "Original value: '"`defaults read com.apple.finder FXPreferredViewStyle`"'"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

echo "---- Finder: Show the Status Bar"
echo "Original value: '"`defaults read com.apple.finder ShowStatusBar`"'"
defaults write com.apple.finder ShowStatusBar -bool true

echo "---- Finder: Show the absolute path in the title bar"
echo "Original value: '"`defaults read com.apple.finder _FXShowPosixPathInTitle`"'"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES

echo "---- Finder: Show icons for hard drives, servers, and removable media on the Desktop"
echo "Original value (ShowExternalHardDrivesOnDesktop): '"`defaults read com.apple.finder ShowExternalHardDrivesOnDesktop`"'"
echo "Original value (ShowHardDrivesOnDesktop): '"`defaults read com.apple.finder ShowHardDrivesOnDesktop`"'"
echo "Original value (ShowMountedServersOnDesktop): '"`defaults read com.apple.finder ShowMountedServersOnDesktop`"'"
echo "Original value (ShowRemovableMediaOnDesktop): '"`defaults read com.apple.finder ShowRemovableMediaOnDesktop`"'"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

echo "---- Speed up Mission Control animations"
echo "Original value: '"`defaults read com.apple.dock expose-animation-duration`"'"
defaults write com.apple.dock expose-animation-duration -float 0.1

echo "---- Dock: Don’t automatically rearrange Spaces based on most recent use"
echo "Original value: '"`defaults read com.apple.dock mru-spaces`"'"
defaults write com.apple.dock mru-spaces -bool false

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

echo "---- Dock: Hot Corners: Bottom-Right screen corner => Start screen saver"
echo "Original value: '"`defaults read com.apple.dock wvous-br-corner`"'"
echo "Original value: '"`defaults read com.apple.dock wvous-br-modifier`"'"
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

echo "---- Dock: Automatically hide and show the Dock"
echo "Original value: '"`defaults read com.apple.dock autohide`"'"
defaults write com.apple.dock autohide -bool true

echo "---- Dock: Remove the auto-hiding delay"
echo "Original value: '"`defaults read com.apple.dock autohide-delay`"'"
defaults write com.apple.dock autohide-delay -float 0

echo "---- Calendar: Display 24 hours"
echo "Original value: '"`defaults read com.apple.iCal "number of hours displayed"`"'"
defaults write com.apple.iCal "number of hours displayed" -int 24

echo "---- Calendar: Scroll in week view by: 'Week, Stop on Today'"
echo "Original value: '"`defaults read com.apple.iCal "scroll by weeks in week view"`"'"
defaults write com.apple.iCal "scroll by weeks in week view" -int 2

echo ---- "Calendar: Show events in year view"
echo "Original value: '"`defaults read com.apple.iCal "Show heat map in Year View"`"'"
defaults write com.apple.iCal "Show heat map in Year View" -bool true

echo "---- Require password immediately after sleep or screen saver begins"
echo "Original value (askForPassword): '"`defaults read com.apple.screensaver askForPassword`"'"
defaults write com.apple.screensaver askForPassword -int 1

echo "---- Show remaining battery time"
echo "Original value: '"`defaults read com.apple.menuextra.battery ShowPercent`"'"
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

echo "---- Sleep after 60 min (all)"
sudo pmset -a sleep 60

echo "---- Turn the display off after 30 min (all)"
sudo pmset -a displaysleep 30

echo "---- Sleep after 30 min (battery [override])"
sudo pmset -b sleep 30

echo "---- Turn the display off after 10 min (battery [override])"
sudo pmset -b displaysleep 10

echo "---- Check for software updates daily (not just once per week)"
echo "Original value: '"`defaults read com.apple.SoftwareUpdate ScheduleFrequency`"'"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "---- Disable swipe between pages"
echo "Original value: '"`defaults read NSGlobalDomain AppleEnableSwipeNavigateWithScrolls`"'"
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool false

echo "---- Enable Silent clicking"
echo "Original value: '"`defaults read com.apple.AppleMultitouchTrackpad ActuationStrength`"'"
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -bool false

echo "---- Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
echo "Original value: '"`defaults read NSGlobalDomain AppleKeyboardUIMode`"'"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "---- Disable press-and-hold for keys in favor of key repeat."
echo "Original value: '"`defaults read -g ApplePressAndHoldEnabled`"'"
defaults write -g ApplePressAndHoldEnabled -bool false

echo "---- Set a blazingly fast keyboard repeat rate"
echo "Original value (KeyRepeat): '"`defaults read NSGlobalDomain KeyRepeat`"'"
echo "Original value (InitialKeyRepeat): '"`defaults read NSGlobalDomain InitialKeyRepeat`"'"
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

echo "---- Use F1, F2, etc. keys as standard function keys"
echo "Original value: '"`defaults read -g com.apple.keyboard.fnState`"'"
defaults write -g com.apple.keyboard.fnState -bool true

echo "---- Touch Bar shows function keys by default"
echo "Original value: '"`defaults read com.apple.touchbar.agent PresentationModeGlobal`"'"
defaults write com.apple.touchbar.agent PresentationModeGlobal -string functionKeys

echo "---- Show day of the week and date in the menu bar"
echo "Original value: '"`defaults read com.apple.menuextra.clock DateFormat`"'"
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM h:mm a"

echo "---- Disable auto-correct"
echo "Original value: '"`defaults read NSGlobalDomain NSAutomaticSpellingCorrectionEnabled`"'"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "---- Disable smart quotes"
echo "Original value: '"`defaults read NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled`"'"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

echo "---- Disable smart dashes"
echo "Original value: '"`defaults read NSGlobalDomain NSAutomaticDashSubstitutionEnabled`"'"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

echo "---- Safari: Prevent Safari from opening 'safe' files automatically after downloading"
echo "Original value: '"`defaults read com.apple.Safari AutoOpenSafeDownloads`"'"
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Setup new window and tab behvior
# 0: Homepage
# 1: Empty Page
# 2: Same Page
# 3: Bookmarks
# 4: Top Sites

echo "---- Safari: New tabs open with an empty page"
echo "Original value: '"`defaults read com.apple.Safari NewTabBehavior`"'"
defaults write com.apple.Safari NewTabBehavior -int 1

echo "---- Safari: New windows open with an empty page"
echo "Original value: '"`defaults read com.apple.Safari NewWindowBehavior`"'"
defaults write com.apple.Safari NewWindowBehavior -int 1

echo "---- Safari: Always prompt for download location"
echo "Original value: '"`defaults read com.apple.Safari AlwaysPromptForDownloadFolder`"'"
defaults write com.apple.Safari AlwaysPromptForDownloadFolder -bool true

# Remove downloads list items
# 0: Manually
# 1: When Safari Quits
# 2: Upon Successful Download
echo "---- Safari: Remove downloaded items from list when Safari quits"
echo "Original value: '"`defaults read com.apple.Safari DownloadsClearingPolicy`"'"
defaults write com.apple.Safari DownloadsClearingPolicy -int 1

echo "---- Safari: Enable DNT Header"
echo "Original value: '"`defaults read com.apple.Safari SendDoNotTrackHTTPHeader`"'"
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

echo "---- Safari: Enable debug menu"
echo "Original value: '"`defaults read com.apple.Safari IncludeInternalDebugMenu`"'"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "---- Reset apps in Dock"
dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/System/Applications/Utilities/Terminal.app"
dockutil --no-restart --add "/Applications/nvALT.app"
dockutil --no-restart --add "/Applications/Spotify.app"
dockutil --no-restart --add "/System/Applications/Messages.app"
dockutil --no-restart --add "/Applications/Sublime Text.app"

echo "---- Killing all affected apps..."
for app in "Calendar" \
  "cfprefsd" \
  "Dock" \
  "Finder" \
  "Messages" \
  "Safari"; do
  killall "${app}" &> /dev/null
done

echo "---- Done. Note that some of these changes require a logout/restart to take effect. Make sure to restart Terminal after reviewing the output"
