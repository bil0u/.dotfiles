if ! command -v brew &>/dev/null; then
	{{ if eq .host.arch "arm64" -}}
	eval "$(/opt/homebrew/bin/brew shellenv)"
	{{ else -}}
	eval "$(/usr/local/bin/brew shellenv)"
	{{ end -}}
fi