$networkDriveLetter = "Z"
$networkAppData = "${networkDriveLetter}:\AppData\Roaming"

Remove-Item -Path "${networkAppData}\*" -Force -Recurse
Remove-Item -Path "${networkDriveLetter}:\Microsoft.PowerShell_profile.ps1"
Remove-Item -Path "${networkDriveLetter}:\.vscode\*" -Force -Recurse

Copy-Item -Path "${env:APPDATA}\Mozilla\" -Destination "${networkAppData}\" -Recurse
Copy-Item -Path $PROFILE -Destination "${networkDriveLetter}:\"
Copy-Item -Path "${env:USERPROFILE}\.vscode\" -Destination "${networkDriveLetter}:\" -Recurse
Copy-Item -Path "${env:APPDATA}\Code\User\" -Destination "${networkAppData}\Code\" -Recurse