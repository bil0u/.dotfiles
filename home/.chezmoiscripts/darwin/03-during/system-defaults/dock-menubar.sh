{{- $config := includeTemplate "get-config" . | fromYaml -}}
{{- template "check-config" $config }}
{{- template "shebang" . }}

set -euo pipefail

# Dock icons size
defaults write com.apple.dock tilesize -float 44
defaults write com.apple.dock magnification -bool false
# System Preferences > Dock & Menubar > Position
defaults write com.apple.dock orientation -string 'bottom'
# System Preferences > Dock & Menubar > Minimize effect
defaults write com.apple.dock mineffect -string 'scale'
# System Preferences > Dock & Menubar > Autohide
defaults write com.apple.dock autohide -bool false
# System Preferences > Dock & Menubar > Disables recent applications
defaults write com.apple.dock show-recents -bool false
# System Preferences > Mission Control > Group by app
defaults write com.apple.dock expose-group-apps -bool true
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true
# Reduces windows on double click in title bar
defaults write -g AppleActionOnDoubleClick -string 'Minimize'
# Extended DateTime format
defaults write com.apple.menuextra.clock DateFormat -string 'EEE d MMM à  HH:mm:ss'
defaults write com.apple.menuextra.clock ShowDate -int 0
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true
defaults write com.apple.menuextra.clock Show24Hour -bool true
defaults write com.apple.menuextra.clock ShowSeconds -bool true
# System Preferences > Mission Control > Rearrange spaces automatically
defaults write com.apple.dock mru-spaces -bool false
# Hides menubar in fullscreen
defaults write -g AppleMenuBarVisibleInFullscreen -bool false
