{{- $config := includeTemplate "get-config" . | fromYaml -}}
{{- template "check-config" $config }}
{{- template "shebang" . }}

set -uo pipefail

# Prevent Photos from opening automatically when devices are plugged in
defaults write com.apple.ImageCapture disableHotPlug -bool true
