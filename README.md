# Compare-Hash
PowerShell function to compare a locally generated cryptographic hash for a given file against a remotely provided one. Useful for insuring the integrity/authenticity of downloaded files.

The function makes use of the existing PowerShell cmdlet 'Get-FileHash' to generate the desired hash, I simply extend the functionality to allow for a comparison.


# Examples

Here we see an example where the provided and generated hash values are a match:

````
PS C:\> Compare-Hash -Algorithm SHA1 -Hash F9A1856F7AD4733F4BB3D84A45DEA612ADD819D6 -Path C:\temp\ComputerName.exe
MATCH
````

Now we see an example where the provided and generated hash values do not match:

````
PS C:\> Compare-Hash -Algorithm SHA1 -Hash DA39A3EE5E6B4B0D3255BFEF95601890AFD80709 -Path C:\temp\ComputerName.exe
NO MATCH
````
