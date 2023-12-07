# Küsi kasutajalt eesnime ja perekonnanime
$eesnimi = Read-Host "Sisesta kasutaja eesnimi"
$perekonnanimi = Read-Host "Sisesta kasutaja perekonnanimi"

# Koosta kasutajanimi
$samAccountName = ($eesnimi.ToLower()) + ($perekonnanimi.ToLower())

# Kontrolli, kas kasutaja on olemas
$olemasolevKasutaja = Get-ADUser -Filter {SamAccountName -eq $samAccountName} -ErrorAction SilentlyContinue

if ($olemasolevKasutaja -ne $null) {
    # Kui kasutaja on juba olemas, anna teade
    Write-Host "Kasutaja $samAccountName on juba olemas."
} else {
    # Kasutajat ei leitud AD-st, loo uus kasutaja
    $parool = Read-Host "Sisesta kasutaja parool" -AsSecureString
    $uusKasutajaNimi = $eesnimi + " " + $perekonnanimi
    New-ADUser -SamAccountName $samAccountName -UserPrincipalName "$samAccountName@sv-kool.local" -Name $uusKasutajaNimi -GivenName $eesnimi -Surname $perekonnanimi -AccountPassword $parool -Enabled $true
    Write-Host "Kasutaja $samAccountName loodud edukalt."
}
