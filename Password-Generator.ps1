# Define a function to generate a password
function Generate-Password {
    param(
        [int]$Length = 10  # Optional parameter to specify password length, default is 10
    )

    # Define character sets
    $lowercaseLetters = 'abcdefghijklmnopqrstuvwxyz'
    $uppercaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    $numbers = '0123456789'
    $specialCharacters = '!@#$%^&*()_+-=[]{}|;:,.<>?'

    # Combine all valid characters into one string
    $validCharacters = $lowercaseLetters + $uppercaseLetters + $numbers + $specialCharacters
    $password = ''  # Initialize an empty string to store the password

    # Generate the password by randomly selecting characters from the valid character set
    for ($i = 1; $i -le $Length; $i++) {
        $randomIndex = Get-Random -Minimum 0 -Maximum $validCharacters.Length
        $password += $validCharacters[$randomIndex]
    }

    $password  # Return the generated password
}

# Generate a password with default length (10)
$generatedPassword = Generate-Password
Write-Output "Generated Password: $generatedPassword"

# Generate a password with specific length (15)
$generatedPassword = Generate-Password -Length 15
Write-Output "Generated Password (Length 15): $generatedPassword"
