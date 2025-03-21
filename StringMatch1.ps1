# Define the regex pattern
$pattern = '[A-Za-z]{1,3}z[0-9a-z]\.:'

# Create a string that matches the pattern
$testString = 'Abz1.:'

# Check if the string matches the pattern
if ($testString -match $pattern) {
    Write-Host "The string matches the pattern."
} else {
    Write-Host "The string does not match the pattern."
}
