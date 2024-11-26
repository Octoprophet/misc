$day = '2024-10-16T00:00:00.000-04:00'
$year = ($day[0..3] -Join '')
$month = ($day[5..6] -Join '')
$day = ($day[8..9] -Join '')


$intDay = [int]$day + 4
$future = $intDay.ToString()

$currentDate = ($month, $day, $year) -join '-'
$futureDate = ($month, $future, $year) -join '-'

Write-Output $currentDate
Write-Output $futureDate