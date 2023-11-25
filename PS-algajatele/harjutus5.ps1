#
# Get-Process command
$notepadProcess = Get-Process -Name "notepad" | Select-Object ProcessName, Id
$notepadProcess

# Get-ChildItem command
$testFiles = Get-ChildItem -Path "C:\temp\test"

# Filter for CSV files
$csvFiles = $testFiles | Where-Object { $_.Extension -eq ".csv" }

# Display information for each CSV file
foreach ($file in $csvFiles) {
    $sizeinKB = $file.Length / 1KB
    $sizeinMB = $file.Length / 1MB

    Write-Host "`nFileName: $($file.Name)"
    Write-Host "Size in KB: $($sizeinKB)"
    Write-Host "Size in MB: $($sizeinMB)"
}
