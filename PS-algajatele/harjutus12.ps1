function CountService {
    param (
        [string]$status
    )

    $services = Get-Service | Where-Object { $_.Status -eq $status }

    Write-Host "Total services in $status state = $($services.Count)"
}

CountService -status Running
CountService -status Stopped
