# Funktsioon, mis kustutab kasutaja
function Remove-MyUser {
    param (
        [string]$username
    )

    try {
        $user = Get-LocalUser -Name $username -ErrorAction Stop
        Remove-LocalUser -Name $user.Name -ErrorAction Stop
        Write-Host "Kasutaja $username on edukalt kustutatud!"
    } catch {
        Write-Host "Viga kustutamisel: $_" -ForegroundColor Red
    }
}

# Küsi kasutaja ees- ja perekonnanime
$eesnimi = Read-Host "Sisesta kasutaja eesnimi (ladina tähtedega):"
$perenimi = Read-Host "Sisesta kasutaja perenimi (ladina tähtedega):"

# Koosta kasutajanimi
$kasutajanimi = $eesnimi.ToLower() + $perenimi.ToLower()

# Kustuta kasutaja
Remove-MyUser -username $kasutajanimi
