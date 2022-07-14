# Download to install folder
cd C:\install

# Download Firewall Rules
# Source URL
$url = "https://raw.githubusercontent.com/jcavalheri/demo_p/main/Scripts/downloadScripts.ps1"
# Destation file
$dest = "c:\install\downloadScripts.ps1"
# Download the file
(New-Object System.Net.WebClient).DownloadFile($url, $dest)

# Start installation of scripts
 "./c:\install\downloadScripts.ps1"

 "./c:\install\firewall.ps1"

 "./c:\install\install_7zip.ps1"

 "./c:\install\install_chrome.ps1"


