$packages = "MacType.MacType", "Mozilla.Firefox.ja", "Microsoft.PowerShell", "Git.Git", "Volta.Volta", "Starship.Starship", "Google.JapaneseIME"
$networkDriveLetter = "Z"
$networkAppData = "${networkDriveLetter}:\System\AppData\Roaming"

Copy-Item -Path "${networkAppData}\Mozilla\*" -Destination "${env:APPDATA}\Mozilla" -Recurse
Copy-Item -Path "${networkDriveLetter}:\Microsoft.PowerShell_profile.ps1" -Destination "${env:USERPROFILE}\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
Remove-Item -Path "${env:USERPROFILE}\.vscode\*" -Force
Copy-Item -Path "${networkDriveLetter}:\.vscode\*" -Destination "${env:USERPROFILE}\.vscode"

for ($i = 0; $i -lt $packages.Count; $i++) {
    winget install $packages[$i]
}

Start-Process -FilePath "volta" -ArgumentList "install node@latest"
Start-Process -FilePath "git" -ArgumentList "clone https://github.com/317moris/ksg-website.git ${env:USERPROFILE}\ksg-website"
Invoke-RestMethod bun.sh/install.ps1 | Invoke-Expression