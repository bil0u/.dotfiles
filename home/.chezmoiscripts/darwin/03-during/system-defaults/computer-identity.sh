{{- $config := includeTemplate "get-config" . | fromYaml -}}
{{- template "check-config" $config }}
{{- template "shebang" . }}

set -euo pipefail

{{ template "darwin/elevate.sh" . }}

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName {{ .host.friendly_name }}
sudo scutil --set HostName {{ .host.host_name }}
sudo scutil --set LocalHostName {{ .host.host_name }}
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName {{ .host.host_name }}
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server ServerDescription {{ .host.host_name }}
dscacheutil -flushcache
