# Define the regex pattern
$pattern = '((.?.?a[0-9]){2}){2}'

# Create a string that matches the pattern
$testString = 'xa1a2ba3a4'

# Check if the string matches the pattern
if ($testString -match $pattern) {
    Write-Host "The string matches the pattern."
} else {
    Write-Host "The string does not match the pattern."
}
