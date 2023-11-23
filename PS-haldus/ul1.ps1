do {
    $eesnimi = Read-Host "Sisesta oma eesnimi (ladina tähtedega):"
    $perenimi = Read-Host "Sisesta oma perenimi (ladina tähtedega):"

    $ladinaTahed = [regex]::IsMatch($eesnimi, "^[a-zA-Z]+$") -and [regex]::IsMatch($perenimi, "^[a-zA-Z]+$")

    if (-not $ladinaTahed) {
        Write-Host "Viga! Nimi peab koosnema ainult ladina tähtedest."
    }

} while (-not $ladinaTahed)

# Loome kasutajanime
$kasutajanimi = $eesnimi.ToLower() + $perenimi.ToLower()

# Loome uue Windowsi kasutaja
New-LocalUser -Name $kasutajanimi -Description "Kasutaja loodud PowerShell skriptiga"

Write-Host "Kasutaja $kasutajanimi loodud edukalt!"
