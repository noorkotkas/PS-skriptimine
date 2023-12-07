# Funktsioon kodukausta varundamiseks
function Backup-UserHomeFolder {
    param(
        [string]$userName
    )

    # Kontrolli, kas kasutaja on olemas
    $existingUser = Get-LocalUser -Name $userName -ErrorAction SilentlyContinue

    if ($existingUser -ne $null) {
        # Koosta kodukausta tee
        $homeFolderPath = "C:\Users\$userName"

        # Koosta varunduskausta tee
        $backupFolderPath = "C:\Backup"

        # Kopeeri ainult kasutaja profiili kaustad
        $profileFolders = @('Desktop', 'Documents', 'Downloads', 'Music', 'Pictures', 'Videos')

        # Kontrolli, kas varunduskaust eksisteerib, kui mitte, loo see
        if (-not (Test-Path -Path $backupFolderPath -PathType Container)) {
            New-Item -Path $backupFolderPath -ItemType Directory
        }

        # Koosta varundusfaili tee
        $backupFileName = "$userName-{0:dd.MM.yyyy}.zip" -f (Get-Date)
        $backupFilePath = Join-Path -Path $backupFolderPath -ChildPath $backupFileName

        # Tee varukoopia kodukausta alamkaustast, kui see eksisteerib
        if (Test-Path -Path $homeFolderPath -PathType Container) {
            # Paki kaust ZIP-failiks
            Compress-Archive -Path $homeFolderPath -DestinationPath $backupFilePath -Force
            Write-Host "Varukoopia kasutaja $userName loodud: $backupFilePath"
        } else {
            Write-Host "Hoiatus: Kasutaja $userName kodukausta ei leitud, varundamine vahele jäetud."
        }
    } else {
        Write-Host "Hoiatus: Kasutajat $userName ei leitud lokaalselt."
    }
}

# Hangi kõik lokaalsed kasutajad
$localUsers = Get-LocalUser

# Loo varundused iga lokaalse kasutaja kohta
foreach ($localUser in $localUsers) {
    Backup-UserHomeFolder -userName $localUser.Name
}
