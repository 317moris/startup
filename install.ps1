$packages = "MacType.MacType", "Mozilla.Firefox.ja", "Microsoft.PowerShell", "Git.Git", "nodejs", "Starship.Starship", "Google.JapaneseIME"
$upgrades = "Microsoft.VisualStudioCode", "Microsoft.VisualStudioCode"
$networkDriveLetter = "Z"
$devDriveLetter = "E"
$networkLocalAppData = "${networkDriveLetter}:\AppData\Local"
$networkAppData = "${networkDriveLetter}:\AppData\Roaming"

New-Item -Path "${env:USERPROFILE}\Documents\" -Name "PowerShell" -ItemType "Directory" 
New-Item -Path "${env:USERPROFILE}\" -Name ".config" -ItemType "Directory"

Copy-Item -Path "${networkAppData}\Mozilla\" -Destination "${env:APPDATA}\" -Recurse
Copy-Item -Path "${networkDriveLetter}:\Microsoft.PowerShell_profile.ps1" -Destination "${env:USERPROFILE}\Documents\"
Remove-Item -Path "${env:USERPROFILE}\.vscode\" -Force -Recurse
Copy-Item -Path "${networkDriveLetter}:\.vscode\" -Destination "${env:USERPROFILE}\" -Recurse
Copy-Item -Path "${networkAppData}\Code\" -Destination "${env:APPDATA}\" -Recurse
Remove-Item -Path "${env:LOCALAPPDATA}\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\*" -Recurse -Force
Copy-Item -Path "${networkLocalAppData}\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\" -Destination "${env:LOCALAPPDATA}\Packages\" -Recurse -Force

Copy-Item -Path "${networkDriveLetter}:\fonts\*" -Destination "${env:LOCALAPPDATA}\Microsoft\Windows\Fonts\"

for ($i = 0; $i -lt $packages.Count; $i++) {
    winget install $packages[$i]
}

for ($i = 0; $i -lt $upgrades.Count; $i++) {
    winget upgrade ${upgrades}[$i]
}

Invoke-RestMethod bun.sh/install.ps1 | Invoke-Expression

& "C:\Program Files\starship\bin\starship.exe" preset bracketed-segments -o "${env:USERPROFILE}\.config\starship.toml"

$git = "C:\Program Files\Git\cmd\git.exe"
& $git clone https://github.com/317moris/ksg-website.git "${devDriveLetter}:\ksg-website"
Set-Location "${devDriveLetter}:\ksg-website\"
& $git fetch
& $git checkout dev
& "${env:USERPROFILE}\.bun\bin\bun.exe" update --latest
