{{- $config := includeTemplate "get-config" . | fromYaml -}}
{{- template "check-config" $config }}
{{- template "shebang" . }}

set -euo pipefail

{{ template "darwin/elevate.sh" . }}

# Enables zoom on screen using Cmd + scrollwheel
sudo defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
sudo defaults write com.apple.universalaccess closeViewScrollWheelModifiersInt -int 262144
