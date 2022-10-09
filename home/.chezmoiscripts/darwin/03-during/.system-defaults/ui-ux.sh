# Set accent color
defaults delete -g AppleAccentColor &>/dev/null || true
defaults delete -g AppleHighlightColor &>/dev/null || true
defaults write -g AppleReduceDesktopTinting -bool false
# Auto switch between light and dark mode
defaults write -g AppleInterfacesStyleSwitchesAutomatically -bool true
# Shows scrollbar automatically
defaults write -g AppleshowScrollBars -string 'Automatic'
# Clic scrollbar to go to clicked location
defaults write -g AppleScrollerPagingBehavior -int 1
# Confirm changes on close
defaults write -g NSCloseAlwaysConfirmChanges -bool false
# Closes windows on app quit
defaults write -g NSQuitAlwaysKeepsWindows -bool false
# Expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true
# Expand print panel by default
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true
# Open home directory instead of iCloud when saving a document
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false
# Set sidebar icon size to medium
defaults write -g NSTableViewDefaultSizeMode -int 2
# Add a context menu item for showing the Web Inspector in web views
defaults write -g WebKitDeveloperExtras -int 1
# Allow keyboard navigation everywhere
defaults write -g AppleKeyboardUIMode -int 3
