# Define the path to your file
$filePath = "C:\Users\cvte1\Downloads\HR_Employee_list.txt"

# Read the content of the file
$content = Get-Content $filePath -Raw

# Use regex to find all periods and count them
$dotCount = ([regex]::Matches($content, '\.')).Count

# Output the count
Write-Output "Total periods found: $dotCount"
