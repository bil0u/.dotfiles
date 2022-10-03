{{- $p := .path }}
{{- $v := .value }}
{{- range $key, $value := $v }}
{{-   if hasPrefix "\\" $key }}
{{-     $d := dict "value" $value "path" (list $p $key | join "") }}
{{-     template "windows/write-registry-chunk.ps1" $d }}
{{-   else }}
{{-     $args := (list "-Name" $key | join " ") }}
{{-     if hasPrefix "map" (typeOf $value) }}
{{-       range $k, $v := $value }}
{{-         $args = (list $args (list "-" $k | join "") $v | join " ") }}
{{-       end }}
{{-     else }}
{{-       $args = (list $args "-Value" $value | join " ") }}
{{-     end }}
Action "> {{ $p }} : {{ $args }}"
If (-Not (Test-Path {{ $p }})) {
    New-Item -Path {{ $p | replace ".*?\\" "" }} -Name {{ $key | replace "\\" "" }} | Out-Null
}
try {
    Set-ItemProperty -Path {{ $p }} {{ $args }} -ErrorAction Stop
} catch {
    New-ItemProperty -Path {{ $p }} {{ $args }}
}
{{-   end }}
{{- end }}