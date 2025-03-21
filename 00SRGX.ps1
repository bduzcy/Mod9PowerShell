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
        # Alphanumeric & Word Boundaries
        "w"  = '\w+'                              # One or more word characters (letters, digits, underscores)
        "wn" = '\W+'                              # One or more non-word characters
        "d"  = '\d+'                              # One or more digits
        "dn" = '\D+'                              # One or more non-digits
        "s"  = '\s+'                              # One or more whitespace characters
        "sn" = '\S+'                              # One or more non-whitespace characters
        
        # Email & Username Patterns
        "e"  = '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'      # Email address
        "u"  = '\b[a-zA-Z0-9._-]{3,16}\b'                                 # Username (3-16 chars, common format)
    
        # URLs
        "url"  = 'https?:\/\/(www\.)?[a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)'
    
        # Dates
        "dateUS"  = '\b(0?[1-9]|1[0-2])[\/\-](0?[1-9]|[12][0-9]|3[01])[\/\-](\d{4})\b' # MM/DD/YYYY or MM-DD-YYYY
        "dateEU"  = '\b(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[0-2])[\/\-](\d{4})\b' # DD/MM/YYYY or DD-MM-YYYY
    
        # Times
        "time"    = '\b([01]?[0-9]|2[0-3]):[0-5][0-9]\b'                               # HH:MM (24-hour format)
    
        # IP Addresses
        "i"       = '\b(?:\d{1,3}\.){3}\d{1,3}\b'                     # IPv4
        "ix"      = '\b(?:\d{1,3}\.){3}\d{1,3}/\d{1,2}\b'            # IPv4 CIDR
        "ipv6"    = '(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|::1)'   # IPv6
    
        # MAC Addresses
        "mac"     = '\b([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})\b'
    
        # Phone Numbers
        "t"       = '\b(?:\(\d{3}\)|\d{3})[-.\s]?\d{3}[-.\s]?\d{4}\b'
        "intlPhone" = '\+?\d{1,4}?[-.\s]?\(?\d{1,3}?\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}'
    
        # Zip / Postal Codes
        "z"       = '\b\d{5}(?:-\d{4})?\b'                         # US ZIP Codes
        "postalUK" = '\b[A-Z]{1,2}\d[A-Z\d]? ?\d[A-Z]{2}\b'        # UK Postal Codes
        "postalCA" = '\b[ABCEGHJKLMNPRSTVXY]\d[ABCEGHJKLMNPRSTVWXYZ]( )?\d[ABCEGHJKLMNPRSTVWXYZ]\d\b'
    
        # Hex Color Codes
        "hexcolor" = '#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3})\b'
    
        # Credit Card Numbers (basic)
        "cc"       = '\b(?:\d[ -]*?){13,16}\b'
    
        # Password Strength (example: at least 1 lowercase, 1 uppercase, 1 digit, 8-20 chars)
        "pwd"      = '^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,20}$'
    
        # HTML Tags
        #"htmltag"  = '<(\"[^\"]*\"|\'[^\']*\'|[^\'\">])*>'
    
        # JSON-like Objects
        "json"     = '{(?:[^{}]|(?R))*}'
    
        # GUIDs
        "guid"     = '\b[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}\b'
    }
    
    Write-Host "`nAvailable Patterns:"
    foreach ($key in $regexOptions.Keys) {
        Write-Host "  ($key)"
    }

    $selection = Read-Host "`nEnter the selection key to get its REGEX"

    if ($regexOptions.ContainsKey($selection)) {
        $regex = $regexOptions[$selection]
        Write-Host "Your REGEX is: $regex"
    } else {
        Write-Host "No match found!"
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
