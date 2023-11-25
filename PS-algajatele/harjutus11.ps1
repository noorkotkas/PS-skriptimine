﻿[int]$n1 = Read-Host "Enter first number"
[int]$n2 = Read-Host "Enter second number"

Write-Host "Calculator" -ForegroundColor Green
Write-Host "1: Addition" -ForegroundColor Yellow
Write-Host "2: Subtraction" -ForegroundColor Yellow
Write-Host "3: Division" -ForegroundColor Yellow
Write-Host "4: Multiplication" -ForegroundColor Yellow
$ch = Read-Host "Enter your choice"

switch ($ch) {
    1 {
        $s = $n1 + $n2
        Write-Host "Sum is: $s"
    }
    2 {
        $s = $n1 - $n2
        Write-Host "Difference is: $s"
    }
    3 {
        if ($n2 -ne 0) {
            $s = $n1 / $n2
            Write-Host "Quotient is: $s"
        } else {
            Write-Host "Cannot divide by zero." -ForegroundColor Red
        }
    }
    4 {
        $s = $n1 * $n2
        Write-Host "Product is: $s"
    }
    Default {
        Write-Host "Invalid choice. Please choose 1, 2, 3, or 4." -ForegroundColor Red
    }
}
