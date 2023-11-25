function MainMenu {
    Clear-Host
    Write-Host "`t`t`tArea Calculator" -ForegroundColor Green
    Write-Host "`n`t`t`tMain Menu" -ForegroundColor Yellow
    Write-Host "`nPlease select the option to perform the respective task`n" -ForegroundColor Yellow
    Write-Host "1: Area of Square" -ForegroundColor Green
    Write-Host "2: Area of Rectangle" -ForegroundColor Green
    Write-Host "3: Area of Circle" -ForegroundColor Green
    Write-Host "4: Area of Triangle" -ForegroundColor Green
    Write-Host "5: Exit`n" -ForegroundColor Green
    $choice = Read-Host "Enter your choice"
    return $choice
}

function CheckMenu {
    Write-Host "`n`nPlease select the next option" -ForegroundColor Yellow
    Write-Host "`n1: Return to Main Menu" -ForegroundColor Green
    Write-Host "2: Exit`n" -ForegroundColor Green
    $ch2 = Read-Host "Enter your choice"
    if ($ch2 -eq "1") {
        continue
    } elseif ($ch2 -eq "2") {
        exit
    } else {
        Write-Host "`nEnter correct option" -ForegroundColor Red
        CheckMenu
    }
}

function CalculateArea {
    param (
        [string]$shape
    )

    Clear-Host
    Write-Host "`t`t`tArea of $shape`n" -ForegroundColor Green

    switch ($shape) {
        "Square" {
            [int]$side = Read-Host "Enter the side of the square"
            $area = $side * $side
        }
        "Rectangle" {
            [int]$length = Read-Host "Enter length of the rectangle"
            [int]$breadth = Read-Host "Enter breadth of the rectangle"
            $area = $length * $breadth
        }
        "Circle" {
            [int]$radius = Read-Host "Enter the radius of the circle"
            $area = 3.14 * $radius * $radius
        }
        "Triangle" {
            [int]$height = Read-Host "Enter height of triangle"
            [int]$base = Read-Host "Enter base of triangle"
            $area = 0.5 * $height * $base
        }
    }

    Write-Host "`nArea of $shape: $area" -ForegroundColor Green
    CheckMenu
}

do {
    $choice = MainMenu
    switch ($choice) {
        1 { CalculateArea -shape "Square" }
        2 { CalculateArea -shape "Rectangle" }
        3 { CalculateArea -shape "Circle" }
        4 { CalculateArea -shape "Triangle" }
    }
} while ($choice -ne "5")
