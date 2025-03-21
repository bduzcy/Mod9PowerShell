# Define the path to file
$filePath = "C:\Users\cvte1\Downloads\HR_Employee_list.txt"

# Initialize a counter for the occurrences
$count = 0

# Read the file line by line
Get-Content -Path $filePath | ForEach-Object {
    # Define the regex pattern to match 'Na' at the beginning of the line
    if ($_ -match '^Na') {
        $count++
    }
}

# Output the result
Write-Host "Total number of times 'Na' appears at the beginning of a line: $count"
