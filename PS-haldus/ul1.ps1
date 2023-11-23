do {
    $eesnimi = Read-Host "Sisesta oma eesnimi (ladina tähtedega):"
    $perenimi = Read-Host "Sisesta oma perenimi (ladina tähtedega):"

    $ladinaTahed = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    $nimeError = $false

    foreach ($t2ht in $eesnimi.ToCharArray()) {
        if ($ladinaTahed -notcontains $t2ht) {
            Write-Host "Viga! Eesnimi peab koosnema ainult ladina tähtedest."
            $nimeError = $true
            break
        }
    }

    foreach ($t2ht in $perenimi.ToCharArray()) {
        if ($ladinaTahed -notcontains $t2ht) {
            Write-Host "Viga! Perenimi peab koosnema ainult ladina tähtedest."
            $nimeError = $true
            break
        }
    }

} while ($nimeError)

Write-Host "Eesnimi: $eesnimi"
Write-Host "Perenimi: $perenimi"
