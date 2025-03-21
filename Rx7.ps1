# Specify the path to your file
$filePath = "C:\Users\cvte1\Downloads\HR_Employee_list.txt"

# Read the file content
$fileContent = Get-Content -Path $filePath -Raw

# Define the regex pattern for IPs in the 150.0.0.0/8 network
$pattern = '\b150\.(?:[0-9]{1,3})\.(?:[0-9]{1,3})\.(?:[0-9]{1,3})\b'

# Find all matches for IPs in the 150.0.0.0/8 network
$ips = [System.Text.RegularExpressions.Regex]::Matches($fileContent, $pattern) | ForEach-Object { $_.Value }

# Count the unique IPs
$ipsCount = $ips.Count

# Output the result
Write-Host "Total number of IPs in the 150.0.0.0/8 network: $ipsCount"
