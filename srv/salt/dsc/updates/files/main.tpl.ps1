$ConfigData = @{
    AllNodes = @(
        @{
            NodeName = 'localhost'
        }
    )
}

Configuration Updates {

    param (

        [Int]$RetryCount=5,
        [Int]$RetryIntervalSec=30
    )

    Import-DscResource -ModuleName PSDesiredStateConfiguration, xWindowsUpdate

    Node $AllNodes.NodeName
    {

        xWindowsUpdateAgent InstallUpdates {
          UpdateNow = $True
          Category = 'Security','Important'
          Notifications = 'Disabled'
          Source = 'WindowsUpdate'
          IsSingleInstance = 'Yes'
        }

    }
}

Updates -ConfigurationData $ConfigData