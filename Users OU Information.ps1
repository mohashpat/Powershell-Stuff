Get-ADUser -Filter * -SearchBase "xxxxx" -ResultPageSize 0 -Property CN, Description, LastLogonTimestamp |
    Select-Object -Property DistinguishedName, Name, samaccountname, Description, Enabled, @{ n = "LastLogonDate"; e = { [datetime]::FromFileTime( $_.lastLogonTimestamp ) } } |
    Sort-Object -Property DistinguishedName, Name, samaccountname, Description, Enabled, LastLogonDate     |
    Export-CSV -NoTypeInformation "C:\xxx.csv"
