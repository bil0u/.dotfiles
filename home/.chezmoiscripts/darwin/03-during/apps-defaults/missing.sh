{{- $config := includeTemplate "get-config" . | fromYaml -}}
{{- template "check-config" $config }}
{{- template "shebang" . }}

set -uo pipefail

{{ template "darwin/elevate.sh" . }}

# action "1Password"
# action "AdGuard"
# action "Batteries"
# action "Browserosaurus"
# action "Discord"
# action "Docker"
# action "Figma"
# action "Firefox"
# action "Google Chrome"
# action "Lepton"
# action "Lunar"
# action "MS Office"
# action "NordVPN"
# action "NZBGet"
# action "ProtonMail Bridge"
# action "The Unarchiver"
# action "Vanilla"
# action "VSCode"
# action "Magnet"
# action "Parcel"
