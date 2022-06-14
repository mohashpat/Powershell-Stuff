Get-ADUser -Filter * -SearchBase "xxxxx" -ResultPageSize 0 -Property CN, Description, LastLogonTimestamp |
    Select-Object -Property CN, Description, @{ n = "LastLogonDate"; e = { [datetime]::FromFileTime( $_.lastLogonTimestamp ) } } |
    Sort-Object -Property CN, Description, LastLogonDate     |
    Export-CSV -NoTypeInformation "C:\myfile.csv"
