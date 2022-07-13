# Source URL
$url = "https://github.com/jcavalheri/demo_p/blob/main/Executables/7z2200-x64.msi"
# Destation file
$dest = "c:\install\7z2200-x64.exe"

# Download to install folder
cd C:\install

# Download the file
(New-Object System.Net.WebClient).DownloadFile($url, $dest)

# Start installation
 msiexec.exe /i c:\install\7z2200-x64.msi /qn