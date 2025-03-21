## SECTION 1: WELCOME PHASE

# Welcome
Write-Host "`n__________________________________`n

Starting SmartRegex Interpreter

`n__________________________________`n"

# Ask for the file to search
$file = Read-Host "`nEnter the file name (with extension)"

# Check if file exists
if (-Not (Test-Path $file)) {
    Write-Host "`nFile not found! Please check the path and try again."
    exit
}


## SECTION 2: INPUT PHASE


# Main function
<#
Choosing from:

1) Translating common characters and strings to REGEX. 

2) Using that REGEX to Count, Match, or Count Unique. 

#>

function SmartRegex  
{
    #Defining the choice

    $choice = Read-Host "`nWhat would you like to do?
    
    (1) Translate to REGEX 
    
    (2) Use Existing REGEX to Count, Match, or Count Unique 
    
    Enter Selection"

    if($choice -eq "1")
    {
        #This chooses the Translation: Function is SmartRegex1
        SmartRegex1
    }
    elseif($choice -eq "2")
    {
        #This chooses Count/Match/CountUnique: Function is SmartRegex2
        SmartRegex2
    }

    ## Start of Translation: SmartRegex1

    


    
    
}



function SmartRegex1
{
        # Get the user's natural language query
        $query = Read-Host "`nDescribe the characters you want to REGEX: 
    
        [OPTIONS]
    



        IP Address:     (i)
        IP Address/x:   (ix)
        Telephone:      (t)

        Zip Code:       (z)
        
        Enter Selection"

        # Initialize variables
        $regexT = ""
        $action = ""
    
        # Basic interpretation (rule-based approach to start)

        switch -Regex ($query) {










        # Match "digits at the end of the line"
        "digits?.*end of the line" {
            $regexT = "\d+$"
            $action = "count"
        }

        # Match "numbers 1, 2, or 3 at the end of the line"
        "numbers?.*(1|2|3).*end of the line" {
            $regexT = "[123]+$"
            $action = "count"
        }

        # Match "letter x at the end of the line"
        "x.*end of the line" {
            $regexT = "x$"
            $action = "count"
        }

        # General fallback if nothing matches
        default {
            Write-Host "`nSorry, I couldn't understand the request."
            Write-Host "Try using patterns like:`n- digits at the end of the line`n- numbers 1, 2, or 3 at the end of the line`n- x appears at the end of the line`n"
            SmartRegex1
            return
        }
        }

        # Display the generated REGEX for transparency
        Write-Host "`nGenerated REGEX: $regexT"
        Write-Host "`nSearching in file: $file"
        Write-Host "`nAction: $action`n_____________________________`n"

    
    
    
    
    
        <#
        
        if ($action -eq "count") {
        $count = (Get-Content $file | Select-String -Pattern $regexT -AllMatches).Matches.Count
        Write-Host "`nTotal Matches Found: $count"
        }
    
    
        elseif($action)
        
        
        #>
        # Perform the action
        








    }



    function SmartRegex2
    {
    
    ## KAHAN CODE FOR COUNTING, MATCHING, AND COUNTING UNIQUE
    #VAR Def IN

    $regexK = Read-Host "`nInput your REGEX"
    $selector = Read-Host "`nCount, Match, or CountUnique (c/m/u)"

    #VAR OUTPUT VER
    Write-Output "_________________________________________`nREGEX = $regexK"
    Write-Output "`nSelector = $selector"
    Write-Output "`nFile Name = $file`n_________________________________________`n"

    if($selector -eq "c")
    {
        #Write-Output "Patterson Sucks"
        (Get-Content .\$file | Select-String -CaseSensitive -Pattern $regexK -AllMatches).Matches.Value.Count
        Write-Output "_________________________________________`n"
    }
    elseif($selector -eq "m")
    {
        #Write-Output "Patterson is Cool"
        (Get-Content $file | Select-String -CaseSensitive -Pattern $regexK -AllMatches | ForEach-Object {$_.Matches.Value})
        Write-Output "_________________________________________`n"
    }
    elseif($selector -eq  "u")
    {
        #Write-Output "Patterson is a God"
        ((Get-Content .\$file | Select-String -CaseSensitive -Pattern $regexK -AllMatches).Matches.Value | Sort-Object -Unique).Count
        Write-Output "_________________________________________`n"
    }
    else
    {
        Write-Output "`nInvalid Input`nTry again idiot`n_________________________________________"
        RegexK
    }
}

    
    
    
    function FinalSmartRegex
{
        # Ask if they want to run again
        $again = Read-Host "`nDo you want to run another search? (y/n)"
        
        if ($again -eq "y") 
        {
            SmartRegex
        } 
        else 
        {
        Write-Host "`nThank you for using SmartRegex!"
        }
        
   FinalSmartRegex

}

    


# Start it up
SmartRegex
