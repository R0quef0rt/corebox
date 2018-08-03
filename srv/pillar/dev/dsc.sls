win_dsc:
  dependencies:
    packageproviders:
      - NuGet
    modules:
      - xActiveDirectory
      - xComputerManagement
      - xNetworking
      - xStorage
      - xRemoteDesktopAdmin
      - xAdcsDeployment
  networking:
    ipaddress: 192.168.5.230