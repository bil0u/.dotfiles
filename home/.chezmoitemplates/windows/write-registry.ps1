{{- range $key, $value := . }}
{{-   $d := dict "value" $value "path" $key }}
{{-   template "windows/write-registry-chunk.ps1" $d }}
{{- end }}