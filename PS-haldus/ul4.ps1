# Küsi kasutajalt eesnime ja perekonnanime
$eesnimi = Read-Host "Sisesta kasutaja eesnimi"
$perekonnanimi = Read-Host "Sisesta kasutaja perekonnanimi"

# Koosta kasutajanimi
$samAccountName = ($eesnimi.ToLower()) + ($perekonnanimi.ToLower())

# Kontrolli, kas kasutaja on olemas
$olemasolevKasutaja = Get-ADUser -Filter {SamAccountName -eq $samAccountName} -ErrorAction SilentlyContinue

if ($olemasolevKasutaja -ne $null) {
    # Kustuta kasutaja
    Remove-ADUser -Identity $samAccountName -Confirm:$false
    Write-Host "Kasutaja $samAccountName kustutatud edukalt."
} else {
    # Kasutajat ei leitud, proovi leida adusers.csv-st
    $kasutajaCSV = Import-Csv "C:\Users\Administrator\Documents\adusers.csv" -Encoding Default -Delimiter ";"
    $leitudKasutaja = $kasutajaCSV | Where-Object { $_.SamAccountName -eq $samAccountName }

    if ($leitudKasutaja -ne $null) {
        # Lisa uus kasutaja adusers.csv andmete põhjal
        $osakond = $leitudKasutaja.Department
        $roll = $leitudKasutaja.Role
        $parool = $leitudKasutaja.Password | ConvertTo-SecureString -AsPlainText -Force

        # Lisa uus kasutaja, kasutades ees- ja perekonnanime
        $uusKasutajaNimi = $eesnimi + " " + $perekonnanimi
        New-ADUser -SamAccountName $samAccountName -UserPrincipalName "$samAccountName@sv-kool.local" -Name $uusKasutajaNimi -GivenName $eesnimi -Surname $perekonnanimi -Department $osakond -Title $roll -AccountPassword $parool -Enabled $true
        Write-Host "Kasutaja $samAccountName lisatud edukalt."
    } else {
        Write-Host "Viga: Kasutajat $samAccountName ei leitud ei AD-st ega ka adusers.csv-st."
    }
}
