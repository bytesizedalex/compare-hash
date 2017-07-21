function Compare-Hash {
    <#
    .SYNOPSIS
    Compares a provided cryptographic hash against a generated one.
    .DESCRIPTION
    Used to compare a provided cryptographic hash against one locally generated for the target file. This is useful to ensure the file has not been altered or corrupted from the original. Updatesand additional information can be found at either https://github.com/bytesizedalex/compare-hash or on my blog https://www.bytesizedalex.com
    .EXAMPLE
    PS C:\> Compare-Hash -Algorithm MD5 -Hash '0CBC6611F5540BD0809A388DC95A615B' -Path C:\Test.txt
    MATCH
    .EXAMPLE
    PS C:\> Compare-Hash -Algorithm MD5 -Hash '123456' -Path C:\Test.txt
    NO MATCH
    .INPUTS
    Takes 3 string values:
    
    Algorithm: the desired cryptographic hash, e.g MD5 or SHA256
    Hash: the hash value provided and used to validate our output
    Path: a file path
 
    .OUTPUTS
    The command outputs a System.String value of 'MATCH' or 'NO MATCH' to indicate whether the hash values are equal.
    .PARAMETER Algorithm
    The cryptographic hash algorithm to be used.
    .PARAMETER Hash
    A provided hash to compare against the generated hash.
    .PARAMETER Path
    The file path to the file to be hash checked.
    #>
 
 
    [CmdletBinding(SupportsShouldProcess = $True, ConfirmImpact = 'Low', HelpUri = 'https://github.com/bytesizedalex/compare-hash')]
    [OutputType([string])]
    [Alias()]
 
    Param (
 
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, HelpMessage = 'Select a cryptographic hash - e.g MD5, SHA1, SHA256, SHA384 or SHA512')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [ValidateSet("MD5", "SHA1", "SHA256", "SHA384", "SHA512")]
        [string]$Algorithm,
 
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, HelpMessage = 'Enter the provided cryptographic hash to validate against.')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [string]$Hash,
 
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, HelpMessage = 'Enter the file path.')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [string]$Path
 
    )
 
    Begin {
 
        Write-Verbose -Message 'Clearing variables'
        Clear-Variable ComputedHash -ErrorAction SilentlyContinue
 
    }
 
    Process {
 
        Write-Verbose -Message 'Generating hash for selected file'
        $ComputedHash = (Get-FileHash -Algorithm $Algorithm -Path $Path -ErrorAction Stop).Hash
 
        Write-Verbose -Message 'Running if/else match loop'
        if ($ComputedHash -eq $Hash) {
 
            Write-Output 'MATCH'
 
        }
 
        else {
 
            Write-Output 'NO MATCH'
 
        }
 
    }
 
    End {
 
    }
 
}
