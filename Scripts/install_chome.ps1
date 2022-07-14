#$LocalTempDir = $env:TEMP; $ChromeInstaller = "ChromeInstaller.exe"; (new-object    System.Net.WebClient).DownloadFile('https://github.com/jcavalheri/demo_p/tree/main/Executables/ChromeSetup.exe', "$LocalTempDir\$ChromeInstaller"); & "$LocalTempDir\$ChromeInstaller" /silent /install; $Process2Monitor =  "ChromeInstaller"; Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)




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

# Start installation
ChromeSetup.exe /silent /install
