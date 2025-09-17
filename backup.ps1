$networkDriveLetter = "Z"
$networkAppData = "${networkDriveLetter}:\System\AppData\Roaming"

Remove-Item -Path "${networkAppData}\Mozilla\*" -Force
Remove-Item -Path "${networkDriveLetter}:\Microsoft.PowerShell_profile.ps1"
Remove-Item -Path "${networkDriveLetter}:\.vscode\*" -Force

Copy-Item -Path "${env:APPDATA}\Mozilla\*" -Destination "${networkAppData}\Mozilla" -Recurse
Copy-Item -Path $PROFILE -Destination "${networkDriveLetter}:\Microsoft.PowerShell_profile.ps1"
Copy-Item -Path "${env:USERPROFILE}\.vscode\*" -Destination "${networkDriveLetter}:\.vscode"