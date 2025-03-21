Function Write-Something {

            Param($item)

            Write-Host "You passed the parameter $item into the function"

}

##

Function Get-MultiplicationResult {

            Param([int]$a,[int]$b)

            $c = $a * $b

            Write-Output $c

}


Get-MultiplicationResult 5 10

##

Function Get-DHCPService { Get-Service -Name DHCP }

##

Function Get-FileLoc {
    
           Param([string]$filter)

           gci -recurse -filter "*$filter*"

}

Get-FileLoc host

##


Function Get-FileLocationInside {

        Param([string]$filter)

        Get-Content .\HR_Employee_list.txt | Select-String -CaseSensitive -AllMatches -Pattern $filter

}


##

Function Stop-Powershell {
$procs = (Get-WmiObject Win32_process | where {$_.Name -eq 'powershell.exe.'} `
        | ?{$_.ProcessId -ne $pid} | Select-Object -ExpandProperty ProcessId)

Do {
    ForEach (

}

}




##

$users = Get-LocalUser | Select-Object -ExpandProperty Name


foreach ($user in $users){
    'User Name: ' + $user
}


##


"Old String" -replace "Old","New"

$ourstring = "PowerShell is dumb and I hate it."

# The replace operator can be stacked multiple times to replace many items
$ourstring -replace "dumb", "awesome" -replace "hate","love"



##






































