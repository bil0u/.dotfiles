# Prevent Time Machine from prompting to use newly connected storage as backup volumes
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
