Invoke-WebRequest -Uri "{{ .url }}" -OutFile "${env:USERPROFILE}\Downloads\{{ .file }}"