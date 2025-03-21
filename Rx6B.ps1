# Path to your file in Downloads
$filePath = "C:\Users\cvte1\Downloads\HR_Employee_list.txt"

# Read the file content
$fileContent = Get-Content -Path $filePath -Raw

# Define the regex pattern to match area codes (numbers in the format (XXX) where X is a digit)
$pattern = '\((\d{3})\)'

# Find all matches for area codes
$areaCodes = [System.Text.RegularExpressions.Regex]::Matches($fileContent, $pattern) | ForEach-Object { $_.Groups[1].Value }

# Get unique area codes
$uniqueAreaCodes = $areaCodes | Sort-Object -Unique

# Count the unique area codes
$uniqueAreaCodesCount = $uniqueAreaCodes.Count

# Output the result
Write-Host "Total unique area codes: $uniqueAreaCodesCount"