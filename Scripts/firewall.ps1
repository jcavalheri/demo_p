if (Test-Path "C:\temp\WFconfiguration.wfw") {
   write-host "Export already exists, presuming that firewall is configured"
 exit 0
}
netsh advfirewall export "C:\temp\WFconfiguration.wfw">>c:\temp\netsh.txt
if (Test-Path  ("C:\temp\WFconfiguration.wfw")) {
   echo "Export C:\temp\WFconfiguration.wfw is geslaagd"
   echo "Lokale firewallrules worden verwijderd"
   echo "COM+ Remote Administration" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="COM+ Remote Administration (DCOM-In)" >>c:\temp\netsh.txt
   echo "DFS Management DCOM" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="DFS Management (DCOM-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="DFS Management (SMB-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="DFS Management (TCP-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="DFS Management (WMI-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Inbound Rule for Remote Shutdown (RPC-EP-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Inbound Rule for Remote Shutdown (TCP-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Administration (NP-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Administration (RPC)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Administration (RPC-EPMAP)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Desktop - RemoteFX (TCP-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Desktop - Shadow (TCP-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Desktop - User Mode (TCP-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Desktop - User Mode (UDP-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Desktop (TCP-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Desktop Services - Shadow (TCP-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Desktop Services - User Mode (TCP-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Desktop Services - User Mode (UDP-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Desktop Services - WMI (DCOM-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Desktop Services - WMI (TCP-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Desktop Services (NP-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Desktop Services (RPC)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Desktop Services (RPC-EPMAP)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Event Log Management (NP-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Event Log Management (RPC)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Event Log Management (RPC-EPMAP)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Scheduled Tasks Management (RPC)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Scheduled Tasks Management (RPC-EPMAP)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Service Management (NP-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Service Management (RPC)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Service Management (RPC-EPMAP)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Volume Management - Virtual Disk Service (RPC)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Volume Management - Virtual Disk Service Loader (RPC)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Remote Volume Management (RPC-EPMAP)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Routing and Remote Access (GRE-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Routing and Remote Access (L2TP-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Routing and Remote Access (PPTP-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="SCW remote access firewall rule - Scshost - Dynamic RPC" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="SCW remote access firewall rule - Scshost - End Point RPC Mapper" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="SCW remote access firewall rule - Svchost - TCP" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Windows Firewall Remote Management (RPC)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Windows Firewall Remote Management (RPC-EPMAP)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Windows Management Instrumentation (ASync-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Windows Management Instrumentation (DCOM-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Windows Management Instrumentation (WMI-In)" >>c:\temp\netsh.txt
   netsh advfirewall firewall delete rule name="Windows Remote Management - Compatibility Mode (HTTP-In)" >>c:\temp\netsh.txt
   $windowsVersion = (Get-WmiObject -class Win32_OperatingSystem).Caption
   if ( ($windowsVersion -match "2012") -or ($windowsVersion -match "2016") ) { netsh advfirewall firewall delete rule name="Windows Remote Management (HTTP-In)" >>c:\temp\netsh.txt }
   netsh advfirewall firewall add rule name="MS SQL Server remote DB connection" description="Microsoft SQL Server port used typically for remote connections to the database." dir=in protocol=tcp action=allow localport=1433 profile=DOMAIN,Private >>c:\temp\netsh.txt
}
else { echo "Locale rules niet verwijderd: Firewall Export niet aanwezig"
   echo "Locale rules niet verwijderd: Firewall Export niet aanwezig" >> c:\temp\netsh.txt
}