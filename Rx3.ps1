# Path to your file in Downloads
$filePath = "C:\Users\cvte1\Downloads\HR_Employee_list.txt"

# Read the entire file as a single string
$content = Get-Content $filePath -Raw

# Define the REGEX pattern and count the matches
$pattern = '\d{3}-84-\d{4}'
$count = ([regex]::Matches($content, $pattern)).Count

# Output the result
Write-Output "Total times '84' appears in the middle of an SSN: $count"
