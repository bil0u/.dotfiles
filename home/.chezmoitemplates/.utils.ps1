function Filename ($str) {
    Write-Output "🟠 $str"
}

function Group ($str) {
    Write-Output "📦 $str"
}

function Prompt ($str) {
    Write-Output "💬 $str"
}

function Pad ($str) {
    Write-Output -NoNewline "   "
}

function Action ($str) {
    Write-Output "🚀 $str"
}

function Ignored ($str) {
    Write-Output "✨ $str"
}

function Error ($str) {
    Write-Error "🛑 $str" >&2
}