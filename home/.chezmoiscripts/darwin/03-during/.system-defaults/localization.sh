# Set locale
defaults write -g AppleLocale -string 'fr_FR'
defaults write -g AppleMetricUnits -bool true
defaults write -g AppleMeasurementUnits -string 'Centimeters'
defaults write -g AppleTemperatureUnit -string 'Celsius'
# Languages and text formats
defaults write -g AppleLanguages -array 'fr-FR' 'en-FR'
defaults write com.apple.translationd InstalledLocales -array 'fr-FR' 'en-US'
# Set the timezone; see `sudo systemsetup -listtimezones` for other values
# sudo systemsetup -settimezone 'Europe/Paris' >/dev/null
