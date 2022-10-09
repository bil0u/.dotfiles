# Hides wifi in menubar
defaults write com.apple.controlcenter 'NSStatusItem Visible Wifi' -bool false
# Hides bluetooth in menubar
defaults write com.apple.controlcenter 'NSStatusItem Visible Bluetooth' -bool false
# Hides airdrop in menubar
defaults write com.apple.controlcenter 'NSStatusItem Visible AirDrop' -bool false
# Hides focus in menubar when not enabled
defaults write com.apple.controlcenter 'NSStatusItem Visible FocusModes' -bool false
# Hides keyboard brightness in menubar
defaults write com.apple.controlcenter 'NSStatusItem Visible KeyboardBrightness' -bool false
# Hides airplay in menubar if not enabled
defaults write com.apple.airplay showInMenuBarIfPresent -bool true
defaults write com.apple.controlcenter 'NSStatusItem Visible ScreenMirroring' -bool false
# Hides display in menubar
defaults write com.apple.controlcenter 'NSStatusItem Visible Display' -bool false
# Hides sound in menubar if not active
defaults write com.apple.controlcenter 'NSStatusItem Visible Sound' -bool false
# Hides accessibility shortcuts in menubar
defaults write com.apple.controlcenter 'NSStatusItem Visible AccessibilityShortcuts' -bool false
# Hides user switcher in menubar
defaults write com.apple.controlcenter 'NSStatusItem Visible UserSwitcher' -bool false
# Hides spotlight in menubar
defaults delete com.apple.Spotlight 'NSStatusItem Visible Item-0' &>/dev/null || true
# Hides siri in menubar
defaults write com.apple.Siri StatusMenuVisible -bool true
# Hides time machine in menubar
defaults write com.apple.systemuiserver dontAutoLoad -array '/System/Library/CoreServices/Menu Extras/TimeMachine.menu'
# Shows date & time
defaults write com.apple.controlcenter 'NSStatusItem Visible Clock' -bool true
# Shows control center icon
defaults write com.apple.controlcenter 'NSStatusItem Visible BentoBox' -bool true
{{- if eq .host.chassis_type "laptop" }}
# Shows battery icon
defaults write com.apple.controlcenter 'NSStatusItem Visible Battery' -bool true
{{- end }}

# TBD
# defaults write com.apple.controlcenter 'NSStatusItem Visible Item-0' '0'
# defaults write com.apple.controlcenter 'NSStatusItem Visible Item-1' '0'
# defaults write com.apple.controlcenter 'NSStatusItem Visible Item-2' '0'
# defaults write com.apple.controlcenter 'NSStatusItem Visible Item-3' '0'
# defaults write com.apple.controlcenter 'NSStatusItem Visible Item-4' '0'
# defaults write com.apple.controlcenter 'NSStatusItem Visible Item-5' '0'
# defaults write com.apple.controlcenter 'NSStatusItem Visible Item-6' '0'
# defaults write com.apple.controlcenter 'NSStatusItem Visible Item-7' '0'
# defaults write com.apple.controlcenter 'NSStatusItem Visible Item-8' '0'
# defaults write com.apple.controlcenter 'NSStatusItem Visible Item-9' '0'
