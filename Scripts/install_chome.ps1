# This script will download the file and do installation

 # Download to install folder
cd C:\install

# Download Firewall Rules
# Source URL
$url = "https://github.com/jcavalheri/demo_p/raw/main/Executables/ChromeSetup.exe"
# Destation file
$dest = "c:\install\ChromeSetup.exe"
# Download the file
(New-Object System.Net.WebClient).DownloadFile($url, $dest)

Sleep 30 
# Start installation
Invoke-expression ChromeSetup.exe /silent /install
