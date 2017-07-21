# Compare-Hash
PowerShell function to compare a locally generated cryptographic hash for a given file against a remotely provided one. Useful for insuring the integrity/authenticity of downloaded files.

The function makes use of the existing PowerShell cmdlet 'Get-FileHash' to generate the desired hash, I simply extend the functionality to allow for a comparison.
