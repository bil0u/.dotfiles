# Enables losless & Dobly Atmos
defaults write com.apple.Music losslessEnabled -bool true
defaults write com.apple.Music downloadDolbyAtmos -bool true
defaults write com.apple.Music dontWarnAboutAlwaysOnDolbyAtmos -bool true
defaults write com.apple.Music dontWarnAboutPlayingDownloadedStereo -bool true
# Sets audio quality
defaults write com.apple.Music preferredDownloadAudioQuality -int 20
defaults write com.apple.Music preferredStreamPlaybackAudioQuality -int 15
# Maxing concurrent music downloads
defaults write com.apple.Music userMaxConcurrentDownloads -int 10
