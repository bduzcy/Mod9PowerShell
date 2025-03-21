# Define the path to file
$filePath = "C:\Users\cvte1\Downloads\HR_Employee_list.txt"

# Read the file content
$fileContent = Get-Content -Path $filePath -Raw

# Define the regex pattern to match 'Antarctica' as a whole word
$pattern = '\bAntarctica\b'

# Find all matches for the word 'Antarctica'
$matches = [System.Text.RegularExpressions.Regex]::Matches($fileContent, $pattern)

# Count the total number of times 'Antarctica' appears
$matchesCount = $matches.Count

# Output the result
Write-Host "Total number of times 'Antarctica' appears: $matchesCount"
