$groups = @("Red", "Green", "Yellow", "Blue")
$result = 1..20 | ForEach-Object {
    $g = Get-Random $groups
    [PSCustomObject]@{
        RollNumber = $_
        Group      = $g
    }
}

$result