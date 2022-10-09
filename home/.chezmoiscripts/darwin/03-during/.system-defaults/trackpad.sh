{{- if eq .host.chassis_type "laptop" }}
# Disables force click
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -int 0
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool true
# Data detection & search w/ 3 fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 2
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad TrackpadThreeFingerTapGesture -int 2
# Secondary click with two fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad TrackpadRightClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad TrackpadCornerSecondaryClick -int 0
defaults write -g ContextMenuGesture -int 1
# Disables tap for click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool false
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad Clicking -bool false
# Make the click softer
defaults write com.apple.AppleMultitouchTrackpad FirstClickTreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad SecondClickTreshold -int 0
# Adjust move speed
defaults write -g com.apple.trackpad.scaling -float 0.6875
# Natural scrolling, smooth, in both directions
defaults write -g com.apple.swipescrolldirection -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadScroll -bool true
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad TrackpadScroll -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadHorizScroll -int 1
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad TrackpadHorizScroll -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadMomentumScroll -bool true
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad TrackpadMomentumScroll -bool true
# Zoom in and out
defaults write com.apple.AppleMultitouchTrackpad TrackpadPinch -bool true
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad TrackpadPinch -bool true
# Intelligent zoom
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -int 1
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad TrackpadTwoFingerDoubleTapGesture -int 1
# Rotate items
defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -bool true
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad TrackpadRotate -bool true
# Navigate between pages w/ 2 fingers
defaults write -g AppleEnableSwipeNavigateWithScrolls -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad TrackpadThreeFingerHorizSwipeGesture -int 0
# Navigate between apps w/ 4 fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad TrackpadFourFingerHorizSwipeGesture -int 2
# Show notifications center w/ 2 fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3
# Show mission control & exposé w/ 3 fingers
defaults write com.apple.dock showMissionControlGestureEnabled -bool true
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad TrackpadThreeFingerVertSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad TrackpadFourFingerVertSwipeGesture -int 2
# Show launchpad gesture
defaults write com.apple.dock showLaunchpadGestureEnabled -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int 2
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad TrackpadFourFingerPinchGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture -int 2
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad TrackpadFiveFingerPinchGesture -int 2
# Show desktop gesture
defaults write com.apple.dock showDesktopGestureEnabled -bool true
# Keep trackpad active when a mouse is plugged
defaults write com.apple.AppleMultitouchTrackpad USBMouseStopsTrackpad -int 0
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad USBMouseStopsTrackpad -int 0
# Detect when hand is on trackpad
defaults write com.apple.AppleMultitouchTrackpad TrackpadHandResting -bool true
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad TrackpadHandResting -bool true

# TBD
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool false
defaults write com.apple.driver.AppleMultitouchTrackpad.trackpad TrackpadThreeFingerDrag -bool false
defaults write com.apple.AppleMultitouchTrackpad UserPreferences -bool true
{{- end }}
