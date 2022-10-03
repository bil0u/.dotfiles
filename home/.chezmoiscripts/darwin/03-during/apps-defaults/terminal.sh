{{- $config := includeTemplate "get-config" . | fromYaml -}}
{{- template "check-config" $config }}
{{- template "shebang" . }}

set -uo pipefail

# Secure Keyboard Entry (see https://security.stackexchange.com/a/47786/8918)
defaults write com.apple.finder SecureKeyboardEntry -bool true
