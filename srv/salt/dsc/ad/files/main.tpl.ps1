$ConfigData = @{
    AllNodes = @(
        @{
            NodeName = 'localhost'
            MachineName = "pdc"
            InterfaceAlias = "Ethernet"
            AddressFamily = 'IPv4'
            DNSAddress = "127.0.0.1", "8.8.8.8"
            PSDscAllowPlainTextPassword = $true
            PSDscAllowDomainUser = $true
        }
    )
}

Configuration BuildADDC {
 
    param (
        [Parameter(Mandatory)]
        [String]$FQDomainName,
 
        [Parameter(Mandatory)]
        [PSCredential]$DomainAdminstratorCreds,
 
        [Int]$RetryCount=5,
        [Int]$RetryIntervalSec=30
    )

    Import-DscResource -ModuleName PSDesiredStateConfiguration, xActiveDirectory, xComputerManagement, xNetworking, xStorage, xRemoteDesktopAdmin, xAdcsDeployment, xWindowsUpdate
 
    Node $AllNodes.NodeName 
    {
 
        # xPendingReboot Reboot
        # {
        #     Name = 'Reboot'
        # } 

        xComputer SetName { 
          Name = $Node.MachineName 
        }

        xWindowsUpdateAgent InstallUpdates {
          UpdateNow = $True
          Category = 'Security','Important'
          Notifications = 'Disabled'
          Source = 'WindowsUpdate'
          IsSingleInstance = 'Yes'
        }
 
        # xIPAddress IPAddress {
        #     InterfaceAlias = $Node.InterfaceAlias
        #     IPAddress = '192.168.5.220'
        #     AddressFamily = $Node.AddressFamily
        # }

        xDNSServerAddress SetDNS {
            Address = $Node.DNSAddress
            InterfaceAlias = $Node.InterfaceAlias
            AddressFamily = $Node.AddressFamily
        }

        WindowsFeature ADDSInstall {
            Ensure = 'Present'
            Name = 'AD-Domain-Services'
        }
 
        WindowsFeature ADDSTools            
        {             
            Ensure = 'Present'             
            Name = 'RSAT-ADDS'             
        }           
 
        xADDomain FirstDC {
            DomainName = $FQDomainName
            DomainAdministratorCredential = $DomainAdminstratorCreds
            SafemodeAdministratorPassword = $DomainAdminstratorCreds
            DependsOn = '[xComputer]SetName','[WindowsFeature]ADDSInstall'
        }   
        
        $domain = $FQDomainName.split('.')[0] 
        xWaitForADDomain DscForestWait
        {
            DomainName = $domain
            DomainUserCredential = $DomainAdminstratorCreds
            RetryCount = $RetryCount
            RetryIntervalSec = $RetryIntervalSec
            DependsOn = '[xADDomain]FirstDC'
        } 
 
        xADRecycleBin RecycleBin
        {
           EnterpriseAdministratorCredential = $DomainAdminstratorCreds
           ForestFQDN = $domain
           DependsOn = '[xADDomain]FirstDC'
        }
        
        xRemoteDesktopAdmin RemoteDesktopSettings
        {
           Ensure = 'Present'
           UserAuthentication = 'Secure'
        }

        # xFirewall AllowRDP
        # {
        #     Name = 'DSC - Remote Desktop Admin Connections'
        #     Group = "Remote Desktop"
        #     Ensure = 'Present'
        #     Enabled = 'True'
        #     Direction = 'Inbound'
        #     LocalPort = '3389'
        #     RemotePort = '3389'
        #     Protocol = 'TCP'
        #     Profile = ('Domain,Private,Public')
        # }

        WindowsFeature ADCS-Cert-Authority
        {
            Ensure = 'Present'
            Name   = 'ADCS-Cert-Authority'
        }

        xAdcsCertificationAuthority CertificateAuthority
        {
            Ensure              = 'Present'
            Credential          = $DomainAdminstratorCreds
            CAType              = 'EnterpriseRootCA'
            CACommonName        = $Node.MachineName
            HashAlgorithmName   = 'SHA256'
            ValidityPeriod      = 'Days'
            ValidityPeriodUnits = '30'
            DependsOn           = '[WindowsFeature]ADCS-Cert-Authority','[xADDomain]FirstDC'
        }
    }
}

$PWord = ConvertTo-SecureString -String "cdi@123" -AsPlainText -Force
$FQDomainName = "internal.cyberdefenses.io"
$DomainAdminstratorCreds=New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList "$FQDomainName\Administrator", $PWord

BuildADDC -ConfigurationData $ConfigData -FQDomainName $FQDomainName -DomainAdminstratorCreds $DomainAdminstratorCreds