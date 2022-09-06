@{
    {{- range $key, $value := ( keys . | uniq) }}
    {{-     if kindIs "list" $value }}
    {{ $key }} = @{ {{ $value | join ", " }} }
    {{-     else if kindIs "string" $value }}
    {{ $key }} = "$value"
    {{-     else }}
    {{ $key }} = $value
    {{-     end }}
    {{- end }}
}
