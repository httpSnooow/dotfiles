
Invoke-Expression (&starship init powershell)

Import-Module PSFzf
Set-PsFzfOption -EnableKeybinding

function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi --cwd-file="$tmp" @args
    if (Test-Path -Path $tmp) {
        $cwd = Get-Content -Path $tmp -Raw
        if ($cwd -ne "" -and $cwd -ne $PWD.Path) {
            Set-Location -Path $cwd
        }
        Remove-Item -Path $tmp
    }
}

