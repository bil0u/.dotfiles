brew bundle --no-lock --file=/dev/stdin <<EOF
{{- range (.taps | uniq) }}
{{- if kindIs "string" . }}
tap '{{ . }}'
{{- else }}
tap '{{ .name }}'{{ if hasKey . "url" }}, "{{ .url }}"{{ end }}
{{- end }}
{{- end }}
# Formulaes
{{- range (.formulaes | uniq) }}
brew '{{ . }}'
{{- end }}
# Casks
{{- range (.casks | uniq) }}
{{- if kindIs "string" . }}
cask '{{ . }}'
{{- else }}
cask '{{ .name }}'{{ if hasKey . "args" }}, args: {{ .args }}{{ end }}
{{- end }}
{{- end }}
# Mac AppStore
{{- range (.mas | uniq) }}
mas '{{ .name }}', id: {{ .id }}
{{- end }}
EOF
