{{- $config := includeTemplate "get-config" . | fromYaml -}}
{{- template "check-config" $config }}
{{- template "shebang" . }}

set -euo pipefail

{{ template "darwin/elevate.sh" . }}

# Sleep the display after 10 minutes
sudo pmset -a displaysleep 10 || true
# Set machine sleep to 15 minutes on battery
sudo pmset -b sleep 15 || true
