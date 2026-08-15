# PowerToys — Config Backup

As configurações do PowerToys ficam em `%LOCALAPPDATA%\Microsoft\PowerToys\`.
Como o chezmoi gerencia o `$HOME`, estes arquivos são mantidos aqui como backup de restauração manual.

## Conteúdo reservado
- `settings.json` (configurações gerais)
- `PowerToys Run/settings.json` (PowerToys Run)
- `Keyboard Manager/settings.json` (remapeamento de teclas)

## Como restaurar em uma nova máquina

1. Instale o PowerToys via Scoop ou Winget:
   ```powershell
   scoop install extras/powertoys
   ```
2. Feche o PowerToys se estiver rodando.
3. Copie os arquivos de backup:
   ```powershell
   Copy-Item -Recurse -Force ".\powertoys\*" "$env:LOCALAPPDATA\Microsoft\PowerToys\"
   ```
4. Inicie o PowerToys.
