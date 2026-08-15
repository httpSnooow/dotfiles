# Windhawk — Config Backup

O Windhawk armazena o perfil em C:\ProgramData\Windhawk\userprofile.json.
Como o chezmoi só gerencia arquivos dentro de %USERPROFILE%, este arquivo é
mantido aqui como referência manual.

## Mods ativos (24 mods)
- custom-corner-radius
- dark-menus
- explorer-details-better-file-sizes
- fix-explorer-white-flash
- hide-start-button
- icon-resource-redirect
- invisible-borders
- shell-flyout-positions
- simple-window-switcher
- taskbar-dock-animation
- taskbar-dock-animation-plus
- taskbar-elastic-pill
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
- windows-animations

## Como restaurar em uma nova máquina

1. Instale o Windhawk: https://windhawk.net
2. Abra o PowerShell como Administrador e execute:

`powershell
Copy-Item ".\windhawk\userprofile.json" "C:\ProgramData\Windhawk\userprofile.json" -Force
`

3. Reinicie o Windhawk — ele vai reimportar todos os mods e configurações.
