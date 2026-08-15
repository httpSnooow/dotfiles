# OBS Studio — Config Backup

As configurações do OBS Studio ficam em `%APPDATA%\obs-studio\`.

## Conteúdo reservado
- `global.ini` / `user.ini`
- Cenas em `basic/scenes/`
- Perfil em `basic/profiles/`

## Como restaurar em uma nova máquina

1. Instale o OBS Studio via Scoop ou instalador oficial.
2. Inicie o OBS Studio uma vez e feche-o.
3. Copie os arquivos de backup:
   ```powershell
   Copy-Item -Recurse -Force ".\obs\*" "$env:APPDATA\obs-studio\"
   ```
