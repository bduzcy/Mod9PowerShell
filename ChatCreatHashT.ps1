function SmartRegex1
{
    $regexOptions = @{
        "a"  = ''
        "b"  = ''
        "c"  = ''
        "i"  = '\b(?:\d{1,3}\.){3}\d{1,3}\b'
        "ix" = '\b(?:\d{1,3}\.){3}\d{1,3}/\d{1,2}\b'
        "t"  = '\b(?:\(\d{3}\)|\d{3})[-.\s]?\d{3}[-.\s]?\d{4}\b'
        "z"  = '\b\d{5}(?:-\d{4})?\b'
    }
    
    $selection = Read-Host "`nEnter your selection:
    (i)     IP Address 
    (ix)    IP Address/CIDR 
    (t)     Telephone
    (z)     Zip Code
    
    Enter Selection"

    if ($regexOptions.ContainsKey($selection)) {
        $regex = $regexOptions[$selection]
        Write-Host "Your REGEX is: $regex"
    } else {
        Write-Host "No match found!"
    }

    FinalSmartRegex
}