# Path to your file in Downloads
$filePath = "C:\Users\cvte1\Downloads\HR_Employee_list.txt"

# Read the file line by line
$content = Get-Content $filePath

# Define the REGEX pattern
$pattern = '72$'

# Count how many lines end with "72"
$count = ($content | Select-String -Pattern $pattern).Count

# Output the result
Write-Output "Total times '72' appears at the end of a line: $count"
