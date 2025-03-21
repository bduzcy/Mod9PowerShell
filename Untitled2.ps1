Function Get-FileLocationInside {

        Param([string]$filter)

        Get-Content .\HR_Employee_list.txt | Select-String -CaseSensitive -AllMatches -Pattern $filter

}

