function Filename {
    Write-Output "$args"
}

function Group {
    Write-Output "$args"
}

function Prompt {
    Write-Output "$args"
}

function Pad {
    Write-Output -NoNewline "    "
}

function Action {
    Write-Output "$args"
}

function Ignored {
    Write-Output "$args"
}

function Error {
    Write-Error "$args"
}