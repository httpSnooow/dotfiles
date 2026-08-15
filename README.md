<div align="center">

```text
  ██████╗  ██████╗ ████████╗███████╗
  ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝
  ██║  ██║██║   ██║   ██║   ███████╗
  ██║  ██║██║   ██║   ██║   ╚════██║
  ██████╔╝╚██████╔╝   ██║   ███████║
  ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝
```

*"windows, but make it not look like windows."*

<br>

![Windows 11](https://img.shields.io/badge/Windows_11-0078D4?style=for-the-badge&logo=windows11&logoColor=white&labelColor=0c0b0f)
![GlazeWM](https://img.shields.io/badge/GlazeWM-8B5CF6?style=for-the-badge&logoColor=white&labelColor=0c0b0f)
![WezTerm](https://img.shields.io/badge/WezTerm-4E9A06?style=for-the-badge&logo=windowsterminal&logoColor=white&labelColor=0c0b0f)
![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white&labelColor=0c0b0f)
![Zen Browser](https://img.shields.io/badge/Zen_Browser-FF6611?style=for-the-badge&logo=firefox&logoColor=white&labelColor=0c0b0f)
![chezmoi](https://img.shields.io/badge/chezmoi-1F6FEB?style=for-the-badge&logo=git&logoColor=white&labelColor=0c0b0f)

<br>

[![last commit](https://img.shields.io/github/last-commit/httpSnooow/dotfiles?style=for-the-badge&logo=git&logoColor=eb6f92&labelColor=0c0b0f&color=eb6f92)](https://github.com/httpSnooow/dotfiles/commits/main)
[![repo size](https://img.shields.io/github/repo-size/httpSnooow/dotfiles?style=for-the-badge&logo=files&logoColor=f6c177&labelColor=0c0b0f&color=f6c177)](https://github.com/httpSnooow/dotfiles)

</div>

<div align="center">
  <img src="./assets/screenshots/desktop.png" width="49%" alt="desktop" />
  <img src="./assets/screenshots/terminal.png" width="49%" alt="terminal" />
  <img src="./assets/screenshots/tiling.png" width="49%" alt="tiling" />
  <img src="./assets/screenshots/editor.png" width="49%" alt="editor" />
</div>

> screenshots pendentes — [veja como tirar](./assets/screenshots/README.md)

<div align="center">

| Base | Surface | Love | Gold | Rose | Pine | Foam | Iris |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| ![#0c0b0f](https://img.shields.io/badge/%230c0b0f-0c0b0f?style=flat-square) | ![#1a1720](https://img.shields.io/badge/%231a1720-1a1720?style=flat-square) | ![#eb6f92](https://img.shields.io/badge/%23eb6f92-eb6f92?style=flat-square) | ![#f6c177](https://img.shields.io/badge/%23f6c177-f6c177?style=flat-square) | ![#bea3c7](https://img.shields.io/badge/%23bea3c7-bea3c7?style=flat-square) | ![#31748f](https://img.shields.io/badge/%2331748f-31748f?style=flat-square) | ![#9ccfd8](https://img.shields.io/badge/%239ccfd8-9ccfd8?style=flat-square) | ![#c4a7e7](https://img.shields.io/badge/%23c4a7e7-c4a7e7?style=flat-square) |

<br>

**Terminal & Shell** | **Window Manager** | **Browser** | **Editor** | **System**
:---:|:---:|:---:|:---:|:---:
![WezTerm](https://img.shields.io/badge/WezTerm-4E9A06?style=flat&logo=windowsterminal&logoColor=white)<br>![Windows Terminal](https://img.shields.io/badge/Windows_Terminal-4D4D4D?style=flat&logo=windowsterminal&logoColor=white)<br>![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=flat&logo=powershell&logoColor=white)<br>![Starship](https://img.shields.io/badge/Starship-DD0B78?style=flat&logo=starship&logoColor=white) | ![GlazeWM](https://img.shields.io/badge/GlazeWM-8B5CF6?style=flat&logoColor=white)<br>![Zebar](https://img.shields.io/badge/Zebar-6366F1?style=flat&logoColor=white)<br>![Komorebi](https://img.shields.io/badge/Komorebi-4B5563?style=flat&logoColor=white)<br>![YASB](https://img.shields.io/badge/YASB-4B5563?style=flat&logoColor=white) | ![Zen Browser](https://img.shields.io/badge/Zen_Browser-FF6611?style=flat&logo=firefox&logoColor=white) | ![Neovim](https://img.shields.io/badge/Neovim-57A143?style=flat&logo=neovim&logoColor=white)<br>![VSCode](https://img.shields.io/badge/VSCode-007ACC?style=flat&logo=visualstudiocode&logoColor=white)<br>![Antigravity IDE](https://img.shields.io/badge/Antigravity_IDE-1F6FEB?style=flat&logo=visualstudiocode&logoColor=white) | ![Windhawk](https://img.shields.io/badge/Windhawk-F59E0B?style=flat&logoColor=white)<br>![PowerToys](https://img.shields.io/badge/PowerToys-0078D4?style=flat&logo=microsoft&logoColor=white)<br>![Fastfetch](https://img.shields.io/badge/Fastfetch-22D3EE?style=flat&logoColor=white)<br>![Scoop](https://img.shields.io/badge/Scoop-1F6FEB?style=flat&logoColor=white)<br>![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white)<br>![OBS Studio](https://img.shields.io/badge/OBS_Studio-302E31?style=flat&logo=obsstudio&logoColor=white)

</div>

<br>

## install

```powershell
irm get.scoop.sh | iex && scoop install chezmoi
chezmoi init --apply https://github.com/httpSnooow/dotfiles.git
```

> windhawk e powertoys: restore manual — ver pastas no repo

<br>

## stack details

| tool | config location | purpose |
|---|---|---|
| [WezTerm](https://wezfurlong.org/wezterm/) | `.wezterm.lua` | terminal emulator |
| [Windows Terminal](https://github.com/microsoft/terminal) | `windows-terminal/` | terminal emulator (backup) |
| [Starship](https://starship.rs) | `.config/starship.toml` | shell prompt |
| [GlazeWM](https://github.com/glzr-io/glazewm) | `.glzr/glazewm/config.yaml` | tiling window manager |
| [Zebar](https://github.com/glzr-io/zebar) | `.glzr/zebar/` | status bar |
| [Komorebi](https://github.com/LGUG2Z/komorebi) | `.config/komorebi/komorebi.json` | tiling window manager (alt) |
| [whkd](https://github.com/LGUG2Z/whkd) | `.config/whkdrc` | hotkey daemon |
| [YASB](https://github.com/amnweb/yasb) | `.config/yasb/` | status bar (alt) |
| [Zen Browser](https://zen-browser.app) | `chrome/` | browser + Nebula theme |
| [Neovim](https://neovim.io) | `AppData/Local/nvim/` | text editor |
| [VSCode](https://code.visualstudio.com/) | `AppData/Roaming/Code/User/` | code editor |
| [Antigravity IDE](https://antigravity.dev/) | `AppData/Roaming/Antigravity IDE/User/` | code editor (alt) |
| [Windhawk](https://windhawk.net) | `windhawk/` | windows system mods |
| [PowerToys](https://learn.microsoft.com/en-us/windows/powertoys/) | `powertoys/` | system utilities |
| [Fastfetch](https://github.com/fastfetch-cli/fastfetch) | `.config/fastfetch/` | system info |
| [OBS Studio](https://obsproject.com/) | `obs/` | streaming & recording |
| [Docker](https://www.docker.com/) | `.docker/daemon.json` | containerization |
| [Scoop](https://scoop.sh/) | `.config/scoop/` | package manager |
| [chezmoi](https://chezmoi.io) | `.chezmoiignore` | dotfiles manager |

<br>

<details>
<summary>⌨️ keybindings</summary>

### glazewm

| action | key |
|---|---|
| Focus left/right/up/down | <kbd>Alt</kbd> + <kbd>H</kbd> / <kbd>L</kbd> / <kbd>K</kbd> / <kbd>J</kbd> ou <kbd>Setas</kbd> |
| Move window left/right/up/down | <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>H</kbd> / <kbd>L</kbd> / <kbd>K</kbd> / <kbd>J</kbd> ou <kbd>Setas</kbd> |
| Resize width (-/+) | <kbd>Alt</kbd> + <kbd>U</kbd> / <kbd>Alt</kbd> + <kbd>P</kbd> |
| Resize height (-/+) | <kbd>Alt</kbd> + <kbd>I</kbd> / <kbd>Alt</kbd> + <kbd>O</kbd> |
| Toggle tiling direction | <kbd>Alt</kbd> + <kbd>V</kbd> |
| Toggle floating | <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>Space</kbd> |
| Toggle tiling | <kbd>Alt</kbd> + <kbd>T</kbd> |
| Toggle fullscreen | <kbd>Alt</kbd> + <kbd>F</kbd> |
| Toggle minimized | <kbd>Alt</kbd> + <kbd>M</kbd> |
| Close window | <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>Q</kbd> |
| Open terminal (WezTerm) | <kbd>Alt</kbd> + <kbd>Enter</kbd> |
| Focus workspace 1-9 | <kbd>Alt</kbd> + <kbd>1</kbd>-<kbd>9</kbd> |
| Move to workspace 1-9 | <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>1</kbd>-<kbd>9</kbd> |
| Next/Prev workspace | <kbd>Alt</kbd> + <kbd>S</kbd> / <kbd>Alt</kbd> + <kbd>A</kbd> |
| Recent workspace | <kbd>Alt</kbd> + <kbd>D</kbd> |
| Reload config | <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>R</kbd> |
| Exit GlazeWM | <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>E</kbd> |
| Toggle pause mode | <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd> |
| Enter resize mode | <kbd>Alt</kbd> + <kbd>R</kbd> |

### komorebi / whkd

| action | key |
|---|---|
| Close window | <kbd>Alt</kbd> + <kbd>Q</kbd> |
| Toggle float | <kbd>Alt</kbd> + <kbd>F</kbd> |
| Open terminal (Windows Terminal) | <kbd>Alt</kbd> + <kbd>Return</kbd> |
| Focus left/down/up/right | <kbd>Alt</kbd> + <kbd>Setas</kbd> |
| Move left/down/up/right | <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>Setas</kbd> |

</details>

<br>

<details>
<summary>🪟 windhawk mods (24 ativos)</summary>

| mod | description |
|---|---|
| `taskbar-vertical` | Taskbar vertical |
| `taskbar-icon-size` | Tamanho dos ícones |
| `taskbar-start-button-position` | Posição do botão Start |
| `taskbar-dock-animation` | Animação de dock |
| `taskbar-dock-animation-plus` | Animação de dock aprimorada |
| `taskbar-elastic-pill` | Pill elástica na taskbar |
| `taskbar-tray-system-icon-tweaks` | Tweaks no system tray |
| `windows-11-taskbar-styler` | Estilo da taskbar |
| `windows-11-start-menu-styler` | Estilo do menu Start |
| `windows-11-start-menu-buttons` | Botões do menu Start |
| `windows-11-notification-center-styler` | Estilo do centro de notificações |
| `windows-11-file-explorer-styler` | Estilo do File Explorer |
| `translucent-windows` | Janelas translúcidas |
| `windows-animations` | Controle de animações do Windows |
| `dark-menus` | Menus escuros |
| `invisible-borders` | Bordas invisíveis |
| `custom-corner-radius` | Border radius customizado nas janelas |
| `uxtheme-hook` | Hook para temas customizados |
| `icon-resource-redirect` | Redirecionamento de ícones |
| `hide-start-button` | Oculta botão Start original |
| `shell-flyout-positions` | Posição dos flyouts do shell |
| `simple-window-switcher` | Alt+Tab alternativo mais simples |
| `fix-explorer-white-flash` | Corrige flash branco no Explorer |
| `explorer-details-better-file-sizes` | Melhora exibição de tamanhos de arquivo |

</details>

<br>

<details>
<summary>🏷️ topics sugeridos para o repositório</summary>

Vá em Settings → Topics e adicione:
`dotfiles` `windows` `windows-11` `ricing` `glazewm` `wezterm` `chezmoi` `rose-pine` `powershell` `starship`

</details>

<br>

<div align="center">
  <sub>crafted with 🖤 on windows 11 &nbsp;·&nbsp; <a href="https://github.com/httpSnooow">httpSnooow</a></sub>
</div>

<!-- 
  para ativar o social preview:
  settings → (no github) → social preview → upload .github/assets/social-preview.svg
-->
