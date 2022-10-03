{{- $config := includeTemplate "get-config" . | fromYaml -}}
{{- template "check-config" $config }}
{{- template "shebang" . }}

set -euo pipefail

# Natural scroll direction
defaults write -g com.apple.swipescrolldirection -bool true
# Mouse cursor speed
defaults write -g com.apple.mouse.scaling -float 0.6875
# Scrolling speed
defaults write -g com.apple.scrollwheel.scaling -float 5
# Double click speed
defaults write -g com.apple.mouse.doubleClickTreshold -float 0.5
