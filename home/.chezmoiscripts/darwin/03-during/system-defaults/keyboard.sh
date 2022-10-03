{{- $config := includeTemplate "get-config" . | fromYaml -}}
{{- template "check-config" $config }}
{{- template "shebang" . }}

set -euo pipefail

# Key repeat speed
defaults write -g KeyRepeat -int 1
# Key repeat delay
defaults write -g InitialKeyRepeat -int 10
# Disables auto period substitution
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
