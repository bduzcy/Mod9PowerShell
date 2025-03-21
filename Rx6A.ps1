# Specify the path to your file
$filePath = "C:\path\to\your\file.txt"

# Read the file content
$fileContent = Get-Content -Path $filePath -Raw

# Define the regex pattern for area codes (assuming they are in the form of (XXX) or XXX)
$pattern = '\(?\d{3}\)?'

# Find all matches for area codes
$areaCodes = [System.Text.RegularExpressions.Regex]::Matches($fileContent, $pattern) | ForEach-Object { $_.Value }

# Get unique area codes
$uniqueAreaCodes = $areaCodes | Sort-Object -Unique

# Count the unique area codes
$uniqueAreaCodesCount = $uniqueAreaCodes.Count

# Output the result
Write-Host "Total unique area codes: $uniqueAreaCodesCount"
