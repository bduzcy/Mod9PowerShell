#Welcome Line
Write-Output "Starting RegexFind`n_________________________________________`n`n"

#File DEF/IN
$file = Read-Host "`nFile Name"


#Regex FN
function Regex
{
    #VAR Def IN
    $regex = Read-Host "`nInput your REGEX"
    $selector = Read-Host "`nCount, Match, or CountUnique (c/m/u)"

    #VAR OUTPUT VER
    Write-Output "_________________________________________`nREGEX = $regex"
    Write-Output "`nSelector = $selector"
    Write-Output "`nFile Name = $file`n_________________________________________`n"

    if($selector -eq "c")
    {
        #Write-Output "Patterson Sucks"
        (Get-Content .\$file | Select-String -CaseSensitive -Pattern $regex -AllMatches).Matches.Value.Count
        Write-Output "_________________________________________`n"
    }
    elseif($selector -eq "m")
    {
        #Write-Output "Patterson is Cool"
        (Get-Content $file | Select-String -CaseSensitive -Pattern $regex -AllMatches | ForEach-Object {$_.Matches.Value})
        Write-Output "_________________________________________`n"
    }
    elseif($selector -eq  "u")
    {
        #Write-Output "Patterson is a God"
        ((Get-Content .\$file | Select-String -CaseSensitive -Pattern $regex -AllMatches).Matches.Value | Sort-Object -Unique).Count
        Write-Output "_________________________________________`n"
    }
    else
    {
        Write-Output "`nInvalid Input`nTry again idiot`n_________________________________________"
        Regex
    }


    function subRegex
    {
        $again = Read-Host "`nDo you want to use the same file for another search? (y/n)"
        Write-Output "`n_________________________________________`n"

        if($again -eq "y")
        {
            Regex
        }
        elseif($again -eq "n")
        {
            Write-Output "`nThank you for REGEX'ing in PS`n"
        }
        else
        {
            Write-Output "`nWTF, input something real`n_________________________________________`n"
            subRegex
        }
    }

    subRegex
}


Regex