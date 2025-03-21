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

###################################
<# SECTION 2: INPUT PHASE


Main function

Choosing from:

1) Translating common characters and strings to REGEX. 

2) Using that REGEX to Count, Match, or Count Unique. 

#>

###################################

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
    
}

###################################

## Start of Translation: SmartRegex1 
function SmartRegex1
{
    $regexOptions = @{
        "w" = @{
            Description = "One or more word characters (letters, digits, underscores)"
            Pattern     = '\w+'
        }
        "wn" = @{
            Description = "One or more non-word characters"
            Pattern     = '\W+'
        }
        "e" = @{
            Description = "Email address"
            Pattern     = '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'
        }
        "url" = @{
            Description = "URL (http or https)"
            Pattern     = 'https?:\/\/(www\.)?[a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)'
        }
        "i" = @{
            Description = "IPv4 address"
            Pattern     = '\b(?:\d{1,3}\.){3}\d{1,3}\b'
        }
        "ix" = @{
            Description = "IPv4 CIDR notation"
            Pattern     = '\b(?:\d{1,3}\.){3}\d{1,3}/\d{1,2}\b'
        }
        "ipv6" = @{
            Description = "IPv6 address"
            Pattern     = '(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|::1)'
        }
        "t" = @{
            Description = "Phone number (US)"
            Pattern     = '\b(?:\(\d{3}\)|\d{3})[-.\s]?\d{3}[-.\s]?\d{4}\b'
        }
        "z" = @{
            Description = "US ZIP code (5-digit or ZIP+4)"
            Pattern     = '\b\d{5}(?:-\d{4})?\b'
        }
        # Add more entries here...
    }

    # Display all options with descriptions
    Write-Host "`nAvailable Patterns:`n" -ForegroundColor Cyan
    foreach ($key in $regexOptions.Keys) {
        $desc = $regexOptions[$key].Description
        Write-Host "  ($key): $desc"
    }

    # Get user selection
    $selection = Read-Host "`nEnter the selection key to get its REGEX"

    # Show results
    if ($regexOptions.ContainsKey($selection)) {
        $chosen = $regexOptions[$selection]
        Write-Host "`nDescription:`n$($chosen.Description)" -ForegroundColor Yellow
        Write-Host "`nYour REGEX is:`n$($chosen.Pattern)" -ForegroundColor Green
    } else {
        Write-Host "`nNo match found!" -ForegroundColor Red
    }

    FinalSmartRegex
}



###################################

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

    FinalSmartRegex
}

###################################

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
}

###################################

# Start it up
SmartRegex
