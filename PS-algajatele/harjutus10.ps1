$ct1 = 0
do {
    $ch = Get-Process -Name "notepad" -ErrorAction SilentlyContinue
    if ($ch -ne $null) {
        Write-Host "Notepad is running"
        Start-Sleep -Seconds 1
        $ct1++
    } else {
        $ct2 = 1
    }
} until ($ct2 -eq 1)

$ct1