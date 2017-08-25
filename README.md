# Compare-Hash
PowerShell function to compare a locally generated cryptographic hash for a given file against a remotely provided one. Useful for insuring the integrity/authenticity of downloaded files.

The function makes use of the existing PowerShell cmdlet 'Get-FileHash' to generate the desired hash, I simply extend the functionality to allow for a comparison.

# Parameters

1. Algorithm - Accepted values are MD5, SHA1, SHA256, SHA384, SHA512
2. Hash - The provided cryptographic hash value to be validated against
3. Path - The path to the file which will be hashed

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

# Dependencies

This function depends on the Get-FileHash cmdlet which is native to PowerShell version 4.0; therefore the system must be running at least version 4.0 or above for this function to work correctly.

# Output Type

The function outputs a System.String value, the results of the Get-Member ouput are provided below for reference.

````
TypeName: System.String

Name             MemberType            Definition                                                                                                    
----             ----------            ----------                                                                                                    
Clone            Method                System.Object Clone(), System.Object ICloneable.Clone()                                                       
CompareTo        Method                int CompareTo(System.Object value), int CompareTo(string strB), int IComparable.CompareTo(System.Object obj...
Contains         Method                bool Contains(string value)                                                                                   
CopyTo           Method                void CopyTo(int sourceIndex, char[] destination, int destinationIndex, int count)                             
EndsWith         Method                bool EndsWith(string value), bool EndsWith(string value, System.StringComparison comparisonType), bool Ends...
Equals           Method                bool Equals(System.Object obj), bool Equals(string value), bool Equals(string value, System.StringCompariso...
GetEnumerator    Method                System.CharEnumerator GetEnumerator(), System.Collections.IEnumerator IEnumerable.GetEnumerator(), System.C...
GetHashCode      Method                int GetHashCode()                                                                                             
GetType          Method                type GetType()                                                                                                
GetTypeCode      Method                System.TypeCode GetTypeCode(), System.TypeCode IConvertible.GetTypeCode()                                     
IndexOf          Method                int IndexOf(char value), int IndexOf(char value, int startIndex), int IndexOf(char value, int startIndex, i...
IndexOfAny       Method                int IndexOfAny(char[] anyOf), int IndexOfAny(char[] anyOf, int startIndex), int IndexOfAny(char[] anyOf, in...
Insert           Method                string Insert(int startIndex, string value)                                                                   
IsNormalized     Method                bool IsNormalized(), bool IsNormalized(System.Text.NormalizationForm normalizationForm)                       
LastIndexOf      Method                int LastIndexOf(char value), int LastIndexOf(char value, int startIndex), int LastIndexOf(char value, int s...
LastIndexOfAny   Method                int LastIndexOfAny(char[] anyOf), int LastIndexOfAny(char[] anyOf, int startIndex), int LastIndexOfAny(char...
Normalize        Method                string Normalize(), string Normalize(System.Text.NormalizationForm normalizationForm)                         
PadLeft          Method                string PadLeft(int totalWidth), string PadLeft(int totalWidth, char paddingChar)                              
PadRight         Method                string PadRight(int totalWidth), string PadRight(int totalWidth, char paddingChar)                            
Remove           Method                string Remove(int startIndex, int count), string Remove(int startIndex)                                       
Replace          Method                string Replace(char oldChar, char newChar), string Replace(string oldValue, string newValue)                  
Split            Method                string[] Split(Params char[] separator), string[] Split(char[] separator, int count), string[] Split(char[]...
StartsWith       Method                bool StartsWith(string value), bool StartsWith(string value, System.StringComparison comparisonType), bool ...
Substring        Method                string Substring(int startIndex), string Substring(int startIndex, int length)                                
ToBoolean        Method                bool IConvertible.ToBoolean(System.IFormatProvider provider)                                                  
ToByte           Method                byte IConvertible.ToByte(System.IFormatProvider provider)                                                     
ToChar           Method                char IConvertible.ToChar(System.IFormatProvider provider)                                                     
ToCharArray      Method                char[] ToCharArray(), char[] ToCharArray(int startIndex, int length)                                          
ToDateTime       Method                datetime IConvertible.ToDateTime(System.IFormatProvider provider)                                             
ToDecimal        Method                decimal IConvertible.ToDecimal(System.IFormatProvider provider)                                               
ToDouble         Method                double IConvertible.ToDouble(System.IFormatProvider provider)                                                 
ToInt16          Method                int16 IConvertible.ToInt16(System.IFormatProvider provider)                                                   
ToInt32          Method                int IConvertible.ToInt32(System.IFormatProvider provider)                                                     
ToInt64          Method                long IConvertible.ToInt64(System.IFormatProvider provider)                                                    
ToLower          Method                string ToLower(), string ToLower(cultureinfo culture)                                                         
ToLowerInvariant Method                string ToLowerInvariant()                                                                                     
ToSByte          Method                sbyte IConvertible.ToSByte(System.IFormatProvider provider)                                                   
ToSingle         Method                float IConvertible.ToSingle(System.IFormatProvider provider)                                                  
ToString         Method                string ToString(), string ToString(System.IFormatProvider provider), string IConvertible.ToString(System.IF...
ToType           Method                System.Object IConvertible.ToType(type conversionType, System.IFormatProvider provider)                       
ToUInt16         Method                uint16 IConvertible.ToUInt16(System.IFormatProvider provider)                                                 
ToUInt32         Method                uint32 IConvertible.ToUInt32(System.IFormatProvider provider)                                                 
ToUInt64         Method                uint64 IConvertible.ToUInt64(System.IFormatProvider provider)                                                 
ToUpper          Method                string ToUpper(), string ToUpper(cultureinfo culture)                                                         
ToUpperInvariant Method                string ToUpperInvariant()                                                                                     
Trim             Method                string Trim(Params char[] trimChars), string Trim()                                                           
TrimEnd          Method                string TrimEnd(Params char[] trimChars)                                                                       
TrimStart        Method                string TrimStart(Params char[] trimChars)                                                                     
Chars            ParameterizedProperty char Chars(int index) {get;}                                                                                  
Length           Property              int Length {get;}
````



