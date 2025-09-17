$packages = "Microsoft.PowerShell", "Git.Git", "Mozilla.Firefox.ja", "Volta.Volta", "MacType.MacType", "Starship.Starship", "Google.JapaneseIME"

for ($i = 0; $i -lt $packages.Count; $i++) {
    & winget install $packages[$i]
}