# Compare-Hash
PowerShell function to compare a locally generated cryptographic hash for a given file against a remotely provided one. Useful for insuring the integrity/authenticity of downloaded files.

The function makes use of the existing PowerShell cmdlet 'Get-FileHash' to generate the desired hash, I simply extend the functionality to allow for a comparison.

# Examples
Example with successful connection:

![alt text](https://user-images.githubusercontent.com/17046773/29732377-40ae0676-89e0-11e7-910b-41135ba6b83e.png "Example with successful connection")

Example with failed connection:

![alt text](https://user-images.githubusercontent.com/17046773/29732474-b14859fe-89e0-11e7-9902-414a256fef98.png "Example with failed connection")
