# Path to your file in Downloads
$filePath = "C:\Users\cvte1\Downloads\HR_Employee_list.txt"

# Read the file line by line
$content = Get-Content $filePath

# Define the REGEX pattern
$pattern = '[1-3]{2}$'

# Count how many lines match the pattern
$count = ($content | Select-String -Pattern $pattern).Count

# Output the result
Write-Output "Total times two digits (1, 2, or 3) appear at the end of a line: $count"
