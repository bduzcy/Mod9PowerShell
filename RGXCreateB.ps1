function Convert-ToRegex {
    param (
        [string]$description
    )

    $patterns = @{
        "area code"   = "\b\d{3}\b"
        "phone number" = "\b\d{3}[-.\s]?\d{3}[-.\s]?\d{4}\b"
        "email"        = "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b"
        ".mil address" = "\b[A-Za-z0-9._%+-]+@[\w.-]+\.mil\b"
        "digit"        = "\d"
        "letter"       = "[A-Za-z]"
        "word"         = "\b\w+\b"
        "whitespace"   = "\s"
    }

    foreach ($key in $patterns.Keys) {
        if ($description -match $key) {
            return $patterns[$key]
        }
    }

    return "No predefined pattern found."
}

# Example usage:
Convert-ToRegex "Find all .mil addresses"
Convert-ToRegex "Extract phone numbers"
