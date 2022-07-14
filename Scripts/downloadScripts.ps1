# Download to install folder
cd C:\install

# Download Firewall Rules
Write-host "# Download Firewall Rules"
# Source URL
$url = "https://raw.githubusercontent.com/jcavalheri/demo_p/main/Scripts/firewall.ps1"
# Destation file
$dest = "c:\install\firewall.ps1"
# Download the file
(New-Object System.Net.WebClient).DownloadFile($url, $dest)


# Download 7 Zip Installation
Write-host "# Download 7 Zip Installation"
# Source URL
$url = "https://raw.githubusercontent.com/jcavalheri/demo_p/main/Scripts/install_7zip.ps1"
# Destation file
$dest = "c:\install\install_7zip.ps1"
# Download the file
(New-Object System.Net.WebClient).DownloadFile($url, $dest)


# Download Chrome Installation
Write-host "# Download Chrome Installation"
# Source URL
$url = "https://raw.githubusercontent.com/jcavalheri/demo_p/main/Scripts/install_chome.ps1"
# Destation file
$dest = "c:\install\install_chome.ps1"
# Download the file
(New-Object System.Net.WebClient).DownloadFile($url, $dest)

Sleep 5

## Do installation after downloading
cd C:\install
./install_7zip.ps1
cd C:\install
./install_chrome.ps1
cd C:\install
./firewall.ps1

