######################
#Terms and Conditions#
######################
<#
By using this program you accept that any answer you get incorrect is your responsibility.
Additionally,, you accept that the program will be rude to you and you will not complain about it.
Lastly, feel free to distribute and modify this code to better suit your preferences.
#>


###############
#initilization#
###############

#line seperator for readability
$script:seperator = "`n________________________________________________________`n"


#welcome line
Write-Output "Starting NewRegexFind$seperator$seperator"

######################
#Function decleration#
######################

#counts each instance of a regex input in $file
function countRegex
{
 #   Param ([string]$file,[string]$regex)
 
    #Write-Output "Patterson Sucks"
    (Get-Content .\$file | Select-String -CaseSensitive -Pattern $regex -AllMatches).Matches.Value.Count
    Write-Output "$seperator"
}

#outputs the matching strings for a regex input in $file
function matchRegex
{
 #   Param ([string]$file,[string]$regex)
 
    #Write-Output "Patterson is Cool"
    (Get-Content $file | Select-String -CaseSensitive -Pattern $regex -AllMatches | ForEach-Object {$_.Matches.Value})
    Write-Output "$seperator"
}

#outputs unique matching strings to regex input in $file
function uniqueRegex
{
 #   Param ([string]$file,[string]$regex)
 
    #Write-Output "Patterson is a God"
    ((Get-Content .\$file | Select-String -CaseSensitive -Pattern $regex -AllMatches).Matches.Value | Sort-Object -Unique).Count
    Write-Output "$seperator"
}
        
#compares your input string to regex
function stringCompare
{
 #   Param([string]$stringPattern,[string]$regex)

    Write-Output "$stringPattern"
    #Write-Output "Patterson is the Apex of the Domain"
    $stringPattern -cmatch $regex
    Write-Output "$seperator"
}

#file read in function
function inputFile
{
    #input file name
    #$script:file = Read-Host "`nFile Name"
    
    try
    {
        $script:file = Read-Host "`nFile Name"
        Get-Item $file -ErrorAction Stop | Out-Null
    }
    catch
    {
        Write-Host "`nMake sure you the correct file or have it in your current working directory. User Error...`n"
        inputFile
    }    
    
}

#selector read in function
function inputSelection
{
    #input selector
    $script:selector = Read-Host "`nCount, Match, Unique, or String Compare (c/m/u/s)"

    if ($selector -eq "c")
    {
        return
    }
    elseif ($selector -eq "m")
    {
        return
    }
    elseif ($selector -eq "u")
    {
        return
    }
    elseif ($selector -eq "s")
    {
        return
    }
    else
    {
        Write-Output "`nInput a real option dipshit... Try again!!`n"
        inputSelection
    }
}

#string compare read in function
function inputStringCompare
{

    #input stringPattern
    try
    {
        $script:stringPattern = Read-Host "`nString Pattern to Compare to Regex"
    }
    catch
    {
        Write-Output "`nNo idea how you even broke this. You are one with the 'tism.`n"
        inputStringCompare
    }
        #Write-Host "$stringPattern"
}

#inputs regex
function inputRegex
{
    #input regex
    try
    {
        $script:regex = Read-Host "`nInput your REGEX"
    }
    catch
    {
         Write-Output "`nNo idea how you even broke this. You are one with the 'tism.`n"
         inputRegex
    }
}

#validates inputs
function inputValidation
{
    Write-Host "$seperator"
    Write-Host "File name is: $file"
    Write-Host "Selector is: $selector"
    Write-Host "Regex is: $regex"
    Write-Host "(Optional) String Pattern is: $stringPattern`n"

    $script:inputValidation = Read-Host "Are these inputs correct? (y/n)"

    if($inputValidation -eq "y")
    {
        Write-Host "$seperator"
        return
    }
    elseif ($inputValidation -eq "n")
    {
        Write-Host "$seperator"
        inputFile
        main
    }
    else
    {
        Write-Host "`nIt's not hard, put in a y or n....`n"
        inputValidation
    }
    
}

#run again
function runAgain
{
    #run again?
    Write-Host "Do you want to run NewRegexFind again?`nRun Again (Same File) = 1`nRun Again (Different File) = 2`nExit = 3"
    $script:again = Read-Host "Your Input"

    if ($again -eq "1")
    {
        Write-Host "$seperator$seperator"
        main
    }
    elseif ($again -eq "2")
    {
        Write-Host "$seperator$seperator"
        inputFile
        main
    }
    elseif ($again -eq "3")
    {
        Write-Output "$seperator$seperator"
        Write-Output "No more Regex? Goodbye trash.$seperator$seperator"
    }
    else
    {
        Write-Output "Why are you being dumb. You can use your fingers to count to 3!!`n"
        runAgain
    }
}



#############
#main method#
#############

function main
{
    #default for string Pattern
    $script:stringPattern = "N/A"
    #chooses selection
    inputSelection


    #if selection is stringCompare, do both string pattern and regex, otherwise just regex
    if($selector -eq "s")
    {
        inputStringCompare
        #Write-Host "$stringPattern"
        inputRegex
    }
    else
    {
        inputRegex
    }

    #validate inputs
    inputValidation

    #regex funtions
    if($selector -eq "c")
    {
        countRegex
    }
    elseif($selector -eq "m")
    {
        matchRegex
    }
    elseif($selector -eq "u")
    {
        uniqueRegex
    }
    elseif($selector -eq "s")
    {
        #Write-Host "$stringPattern"
        stringCompare
    }
    else
    {
        Write-Output "$seperatorCongrats, you broke my program.$seperator"
        main
    }

    #$stringPattern = "N/A"
    #run again??
    runAgain
}

#initial File Input and start Main
inputFile
main