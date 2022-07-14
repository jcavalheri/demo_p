# This script will download the file and do installation

 # Download to install folder
cd C:\install

# Download Firewall Rules
# Source URL
$url = "https://github.com/jcavalheri/demo_p/raw/e53d3b202512cc4bb4aae4ae0f757f098f1244f3/Executables/7z2200-x64.msi"
# Destation file
$dest = "c:\install\7z2200-x64.msi"
# Download the file
(New-Object System.Net.WebClient).DownloadFile($url, $dest)

Sleep 5

# Start installation
msiexec.exe /i 7z2200-x64.msi /qn
