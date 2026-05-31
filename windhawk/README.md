# Windhawk — Config Backup

O Windhawk armazena o perfil em C:\ProgramData\Windhawk\userprofile.json.
Como o chezmoi só gerencia arquivos dentro de %USERPROFILE%, este arquivo é
mantido aqui como referência manual.

## Mods ativos (19 mods)
- dark-menus
- explorer-details-better-file-sizes
- fix-explorer-white-flash
- hide-start-button
- icon-resource-redirect
- invisible-borders
- shell-flyout-positions
- taskbar-dock-animation
- taskbar-icon-size
- taskbar-start-button-position
- taskbar-tray-system-icon-tweaks
- taskbar-vertical
- translucent-windows
- uxtheme-hook
- windows-11-file-explorer-styler
- windows-11-notification-center-styler
- windows-11-start-menu-buttons
- windows-11-start-menu-styler
- windows-11-taskbar-styler

## Como restaurar em uma nova máquina

1. Instale o Windhawk: https://windhawk.net
2. Abra o PowerShell como Administrador e execute:

`powershell
Copy-Item ".\windhawk\userprofile.json" "C:\ProgramData\Windhawk\userprofile.json" -Force
`

3. Reinicie o Windhawk — ele vai reimportar todos os mods e configurações.
