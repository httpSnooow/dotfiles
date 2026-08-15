# Windows Terminal — Config Backup

As configurações do Windows Terminal ficam em:
`%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json`

## Como restaurar em uma nova máquina

1. Abra o Windows Terminal pelo menos uma vez para criar a pasta da aplicação.
2. Copie o arquivo de configurações:
   ```powershell
   $dest = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
   Copy-Item ".\windows-terminal\settings.json" $dest -Force
   ```
