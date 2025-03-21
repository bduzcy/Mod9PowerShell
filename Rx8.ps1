# Specify the path to your file
$filePath = "C:\Users\cvte1\Downloads\HR_Employee_list.txt"

# Read the file content
$fileContent = Get-Content -Path $filePath -Raw

# Define the regex pattern for emails ending in .mil
$pattern = '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.mil\b'

# Find all matches for .mil email addresses
$milEmails = [System.Text.RegularExpressions.Regex]::Matches($fileContent, $pattern) | ForEach-Object { $_.Value }

# Count the number of .mil email addresses
$milEmailsCount = $milEmails.Count

# Output the result
Write-Host "Total number of .mil email addresses: $milEmailsCount"
