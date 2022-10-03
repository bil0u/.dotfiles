{{- $config := includeTemplate "get-config" . | fromYaml -}}
{{- template "check-config" $config }}
{{- template "shebang" . }}

set -euo pipefail

{{ template "darwin/elevate.sh" . }}

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true
