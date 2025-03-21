Function Get-IT {

        Param([string]$filter)

        Get-Content .\HR_Employee_list.txt | Select-String -CaseSensitive -AllMatches -Pattern $filter

}

$AC = Get-IT '\((\d{3})\)'

$UAC = $AC | Sort-Object -Unique

$UACC = $UAC.count

Write-Host "Total unique areac codes: $UACC"


