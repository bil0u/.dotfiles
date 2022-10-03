{{- $config := includeTemplate "get-config" . | fromYaml -}}
{{- template "check-config" $config }}
{{- template "shebang" . }}

set -euo pipefail

# Prevent Time Machine from prompting to use newly connected storage as backup volumes
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
