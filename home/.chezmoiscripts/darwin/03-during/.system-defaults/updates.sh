# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true
# defaults write com.apple.finder AutoUpdate -bool true
# Allow the App Store to reboot machine on macOS updates
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true
# defaults write com.apple.finder AutoUpdateRestartRequired -bool true
# Automatically check for updates.
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
# Download new updates when available.
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
# Installs critical updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
