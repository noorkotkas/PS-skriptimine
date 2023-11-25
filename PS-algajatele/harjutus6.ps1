$csv = Import-Csv C:\temp\students.csv

$result = foreach ($c in $csv) {
    $age = [int]$c.Age
    $school = switch ($age) {
        { $_ -ge 4 -and $_ -le 10 } { "Junior" }
        { $_ -ge 11 -and $_ -le 17 } { "Senior" }
        Default { $null }
    }

    [PSCustomObject]@{
        Name   = $c.Name
        School = $school
    }
}

$result