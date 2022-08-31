function Start-Shell {
    param(
        [switch]
        $CloseCurrentWindow,
	
        [Parameter(
            DontShow = $true,
            ValueFromRemainingArguments = $true
        )]
        [string]
        $Command
    )
    if (-not [string]::IsNullOrWhiteSpace($Command)) {
        Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList "-NoExit $command"
        if ($CloseCurrentWindow.IsPresent) {
            Stop-Process -Id $PID
        }
    }
}