Import-Module ActiveDirectory

$file = "C:\app\dev\srv\salt\dsc\ad\files\users.csv"
$users = Import-Csv $file

foreach ($user in $users)
{
    $password = (ConvertTo-SecureString -AsPlainText $user.Password -Force)
    $displayname = $user.FirstName + " " + $user.LastName 

    $Parameters = @{
      'Name'                  = $displayname
      'GivenName'             = $user.FirstName 
      'Surname'               = $user.LastName
      'AccountPassword'       = $password
      'Enabled'               = $true 
    }

    New-ADUser @Parameters
}

