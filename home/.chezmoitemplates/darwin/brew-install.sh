brew bundle --no-lock --file=/dev/stdin <<EOF
{{- range (.taps | uniq) }}
tap '{{ . }}'
{{- end }}
# Formulaes
{{- range (.formulaes | uniq) }}
brew '{{ . }}'
{{- end }}
# Casks
{{- range (.casks | uniq) }}
cask '{{ . }}'
{{- end }}
# Mac AppStore
{{- range (.mas | uniq) }}
mas '{{ .name }}', id: {{ .id }}
{{- end }}
EOF
