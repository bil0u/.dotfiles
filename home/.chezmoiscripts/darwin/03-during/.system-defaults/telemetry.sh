# Disables targeted ads
defaults write com.apple.AdLib allowApplePersonalizedAdvertising -bool false
defaults write com.apple.AdLib allowIdentifierForAdvertising -bool false
# Disables autogathering large files when submitting a feedback report
defaults write com.apple.appleseed.FeedbackAssistant Autogather -bool false

action "Configuring host file"

sudo curl -s "https://someonewhocares.org/hosts/hosts" -o "/etc/hosts"
sudo killall -HUP mDNSResponder >/dev/null
