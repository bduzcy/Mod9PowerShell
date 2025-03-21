# Define the path to file
$filePath = "C:\Users\cvte1\Downloads\HR_Employee_list.txt"

# Read the file content
$fileContent = Get-Content -Path $filePath -Raw

# Define the regex pattern to match ': S'
$pattern = ': S'

# Find all matches for ': S'
$matches = [System.Text.RegularExpressions.Regex]::Matches($fileContent, $pattern)

# Count the total number of times ': S' appears
$matchesCount = $matches.Count

# Output the result
Write-Host "Total number of times ': S' appears: $matchesCount"
