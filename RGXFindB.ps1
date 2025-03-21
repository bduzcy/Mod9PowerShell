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

# Main function
function SmartRegex {
    # Get the user's natural language query
    $query = Read-Host "`nDescribe your REGEX search in plain English
    
    [OPTIONS]
    
    Digits at the end of the line
    Numbers x, x, or x end of the line
    Letter x at the end of the line
    
    Enter here"
    
    # Initialize variables
    $regex = ""
    $action = ""
    
    # Basic interpretation (rule-based approach to start)
    switch -Regex ($query) {

        # Match "digits at the end of the line (a)"
        "digits?.*end of the line" {
            $regex = "\d+$"
            $action = "count"
        }

        # Match "numbers 1, 2, or 3 at the end of the line (b)"
        "numbers?.*(1|2|3).*end of the line" {
            $regex = "[123]+$"
            $action = "count"
        }

        # Match "letter x at the end of the line (c)"
        "x.*end of the line" {
            $regex = "x$"
            $action = "count"
        }

        # General fallback if nothing matches
        default {
            Write-Host "`nSorry, I couldn't understand the request."
            Write-Host "Try using patterns like:`n- digits at the end of the line`n- numbers 1, 2, or 3 at the end of the line`n- x appears at the end of the line`n"
            SmartRegex
            return
        }
    }

    # Display the generated REGEX for transparency
    Write-Host "`nGenerated REGEX: $regex"
    Write-Host "`nSearching in file: $file"
    Write-Host "`nAction: $action`n_____________________________`n"

    # Perform the action
    if ($action -eq "count") {
        $count = (Get-Content $file | Select-String -Pattern $regex -AllMatches).Matches.Count
        Write-Host "`nTotal Matches Found: $count"
    }
    
    # Ask if they want to run again
    $again = Read-Host "`nDo you want to run another search? (y/n)"
    if ($again -eq "y") {
        SmartRegex
    } else {
        Write-Host "`nThank you for using SmartRegex!"
    }
}

# Start it up
SmartRegex