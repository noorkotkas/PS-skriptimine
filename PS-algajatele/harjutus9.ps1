$ct1 = 0
do {
    $ch = Get-Process -Name "notepad" -ErrorAction SilentlyContinue
    if ($ch -ne $null) {
        $ct1++
        Write-Host "Notepad is running"
        Start-Sleep -Seconds 1
    }
} while ($ch -ne $null)

$ct1