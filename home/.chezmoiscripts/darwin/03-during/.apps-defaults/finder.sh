# View > As column.
defaults write com.apple.finder FXPreferredViewStyle -string clmv
# View > Show view options > Sort Group By > Name.
defaults write com.apple.finder FXArrangeGroupViewBy -string Name
# View > Show view options > Group By > None.
defaults write com.apple.finder FXPreferredGroupBy -string None
# Search the current folder when performing a seach.
defaults write com.apple.finder FXDefaultSearchScope -string SCcf
# New Finder windows show Home directory.
defaults write com.apple.finder NewWindowTarget -string PfHm
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"
# Show these items on the desktop:
#   - Hard disks
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
#   - External hard drives
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
#   - Removable medias
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
#   - Servers
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true
# Show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false
# Disables warning when modifying a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Hide tags
defaults write com.apple.finder ShowRecentTags -bool false
# Enable iCloud Drive
defaults write com.apple.finder FXICloudDriveEnabled -bool true
defaults write com.apple.finder FXICloudDriveDesktop -bool true
defaults write com.apple.finder FXICloudDriveDocuments -bool true
# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true
# Disable .DS_Store files on network drives.
defaults write com.apple.desktopservices DSDontWriteNetworkStores '1'
# Disable .DS_Store files on external drives.
defaults write com.apple.desktopservices DSDontWriteUSBStores '1'
