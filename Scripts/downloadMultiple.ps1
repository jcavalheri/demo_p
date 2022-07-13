$baseUri = 'https://github.com/jcavalheri/demo_p/blob/main/'
$files = @(
    @{
        Uri = "$baseUri/Scripts/install_7zip.ps1"
        OutFile = 'install_7zip.ps1'
    },
    @{
        Uri = "$baseUri/Scripts/install_chrome.ps1"
        OutFile = 'install_chrome.ps1'
    },
    @{
        Uri = "$baseUri/Executables/7z2200-x64.msi"
        OutFile = '7z2200-x64.msi'
    },
    @{
        Uri = "$baseUri/Executables/7z2200-x64.exe"
        OutFile = '7z2200-x64.exe'
    }
)

$jobs = @()

foreach ($file in $files) {
    $jobs += Start-ThreadJob -Name $file.OutFile -ScriptBlock {
        $params = $using:file
        Invoke-WebRequest @params
    }
}

Write-Host "Downloads started..."
Wait-Job -Job $jobs

foreach ($job in $jobs) {
    Receive-Job -Job $job
}