$Users = get-content c:\admin.txt
ForEach ($User In $Users)
{
  "User: $User"
  Get-ADPrincipalGroupMembership -Identity $User | select @{e={$_.DistinguishedName  -replace 'CN=|,..=.+'}}
  } 