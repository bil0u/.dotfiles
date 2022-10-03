{{- $config := includeTemplate "get-config" . | fromYaml -}}
{{- template "check-config" $config }}
{{- template "shebang" . }}

set -uo pipefail

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/.iterm/"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
# Saves preferences on quit
defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile_selection 0
