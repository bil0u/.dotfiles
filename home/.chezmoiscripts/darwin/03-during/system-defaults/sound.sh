{{- $config := includeTemplate "get-config" . | fromYaml -}}
{{- template "check-config" $config }}
{{- template "shebang" . }}

set -euo pipefail

# Disables screen flash
defaults write -g com.apple.sound.beep.flash -int 0
# Set beep sound
defaults write -g com.apple.sound.beep.sound -string /System/Library/Sounds/funk.aiff
