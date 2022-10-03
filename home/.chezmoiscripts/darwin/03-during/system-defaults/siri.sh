{{- $config := includeTemplate "get-config" . | fromYaml -}}
{{- template "check-config" $config }}
{{- template "shebang" . }}

set -euo pipefail

defaults write com.apple.Siri StatusMenuVisible -bool false
defaults write com.apple.Siri VoiceTriggerUserEnabled -bool true
