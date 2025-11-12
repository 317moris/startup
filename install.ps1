$packages = "MacType.MacType", "Mozilla.Firefox.ja", "Microsoft.PowerShell", "Git.Git", "nodejs", "Starship.Starship", "Google.JapaneseIME"
$networkDriveLetter = "Z"
$devDriveLetter = "E"
$networkAppData = "${networkDriveLetter}:\AppData\Roaming"

New-Item -Path "${env:USERPROFILE}\Documents\" -Name "PowerShell" -ItemType "Directory" 
New-Item -Path "${env:USERPROFILE}\" -Name ".config" -ItemType "Directory"

Copy-Item -Path "${networkAppData}\Mozilla\" -Destination "${env:APPDATA}\" -Recurse
Copy-Item -Path "${networkDriveLetter}:\Microsoft.PowerShell_profile.ps1" -Destination "${env:USERPROFILE}\Documents\"
Remove-Item -Path "${env:USERPROFILE}\.vscode\" -Force
Copy-Item -Path "${networkDriveLetter}:\.vscode\" -Destination "${env:USERPROFILE}\"
Copy-Item -Path "${networkAppData}\Code\" -Destination "${env:APPDATA}\" -Recurse

for ($i = 0; $i -lt $packages.Count; $i++) {
    winget install $packages[$i]
}

Start-Process -FilePath "C:\Program Files\Git\cmd\git.exe" -ArgumentList "clone https://github.com/317moris/ksg-website.git ${devDriveLetter}:\ksg-website"
Invoke-RestMethod bun.sh/install.ps1 | Invoke-Expression
Start-Process -FilePath "C:\Program Files\starship\bin\starship.exe" -ArgumentList "preset bracketed-segments -o ${env:USERPROFILE}\.config\starship.toml"