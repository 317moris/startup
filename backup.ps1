$networkDriveLetter = "Z"
$networkAppData = "${networkDriveLetter}:\AppData\Roaming"
$networkLocalAppData = "${networkDriveLetter}:\AppData\Local"

Remove-Item -Path "${networkAppData}\*" -Force -Recurse
Remove-Item -Path "${networkDriveLetter}:\Microsoft.PowerShell_profile.ps1"
Remove-Item -Path "${networkDriveLetter}:\.vscode\" -Force -Recurse
Remove-Item -Path "${networkLocalAppData}\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\" -Recurse -Force

Copy-Item -Path "${env:APPDATA}\Mozilla\" -Destination "${networkAppData}\" -Recurse
Copy-Item -Path $PROFILE -Destination "${networkDriveLetter}:\"
Copy-Item -Path "${env:USERPROFILE}\.vscode\" -Destination "${networkDriveLetter}:\" -Recurse
Copy-Item -Path "${env:APPDATA}\Code\" -Destination "${networkAppData}\" -Recurse
Copy-Item -Path "${env:LOCALAPPDATA}\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\" -Destination "${networkLocalAppData}\Packages\" -Recurse -Force