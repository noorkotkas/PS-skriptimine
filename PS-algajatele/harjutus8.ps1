while (Get-Process -Name Notepad -ErrorAction SilentlyContinue) {
    Write-Host "Notepad is running"
    Start-Sleep -Seconds 1
}