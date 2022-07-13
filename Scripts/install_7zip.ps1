# Source URL
$url = "https://github.com/jcavalheri/demo_p/blob/main/Executables/7z2200-x64.msi"
# Destation file
$dest = "c:\install\7z2200-x64.msi"

# Download the file
Invoke-WebRequest -Uri $url -OutFile $dest

# Start installation
msiexec /i c:\install\7z2200-x64.msi /qn
