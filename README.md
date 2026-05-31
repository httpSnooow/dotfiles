<div align="center">

# 🏠 dotfiles

![chezmoi](https://img.shields.io/badge/chezmoi-managed-1F6FEB?style=for-the-badge&logo=git&logoColor=white)
![Windows](https://img.shields.io/badge/Windows_11-0078D4?style=for-the-badge&logo=windows11&logoColor=white)
![GlazeWM](https://img.shields.io/badge/GlazeWM-tiling_wm-8B5CF6?style=for-the-badge&logoColor=white)
![Zen Browser](https://img.shields.io/badge/Zen_Browser-FF6611?style=for-the-badge&logo=firefox&logoColor=white)

### My personal dotfiles — managed with chezmoi
*One command to restore the entire setup on any machine.*

</div>

---

## 🛠️ Stack

<div align="left">

**Terminal & Shell**

![WezTerm](https://img.shields.io/badge/WezTerm-4E9A06?style=for-the-badge&logo=windowsterminal&logoColor=white)
![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)
![Starship](https://img.shields.io/badge/Starship-DD0B78?style=for-the-badge&logo=starship&logoColor=white)

**Window Manager & Bar**

![GlazeWM](https://img.shields.io/badge/GlazeWM-8B5CF6?style=for-the-badge&logoColor=white)
![Zebar](https://img.shields.io/badge/Zebar-status_bar-6366F1?style=for-the-badge&logoColor=white)

**Browser**

![Zen Browser](https://img.shields.io/badge/Zen_Browser-FF6611?style=for-the-badge&logo=firefox&logoColor=white)

**Editors**

![VSCode](https://img.shields.io/badge/VSCode-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white)
![Antigravity IDE](https://img.shields.io/badge/Antigravity_IDE-1F6FEB?style=for-the-badge&logo=visualstudiocode&logoColor=white)

**System Customization**

![Windhawk](https://img.shields.io/badge/Windhawk-19_mods-F59E0B?style=for-the-badge&logoColor=white)
![Fastfetch](https://img.shields.io/badge/Fastfetch-system_info-22D3EE?style=for-the-badge&logoColor=white)

</div>

---

## 📂 O que está versionado

| Categoria | Programa | Arquivo(s) |
| :--- | :--- | :--- |
| **Terminal** | WezTerm | `.wezterm.lua` |
| **Terminal** | Starship | `.config/starship.toml` |
| **Shell** | PowerShell | `Documents/WindowsPowerShell/profile.ps1` |
| **Shell** | whkd | `.config/whkdrc` |
| **Fetch** | Fastfetch | `.config/fastfetch/` (config + ascii art) |
| **WM** | GlazeWM | `.glzr/glazewm/config.yaml` |
| **Bar** | Zebar | `.glzr/zebar/settings.json` + temas `rose-pine-custom`, `vanilla-clear` |
| **WM** | Komorebi | `.config/komorebi/komorebi.json` |
| **Bar** | YASB | `.config/yasb/config.yaml` + `styles.css` |
| **Browser** | Zen Browser | `chrome/userChrome.css` + tema **Nebula** (15 CSS modules) + `zen-keyboard-shortcuts.json` |
| **Editor** | VSCode | `AppData/Roaming/Code/User/settings.json` |
| **Editor** | Antigravity IDE | `settings.json` + `keybindings.json` |
| **System** | Windhawk | `userprofile.json` — 19 mods ativos *(ver nota abaixo)* |
| **Package** | Scoop | `.config/scoop/config.json` |

---

## ⚡ Instalação

### Pré-requisitos

```powershell
# Instalar Scoop (se não tiver)
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

# Instalar chezmoi
scoop install chezmoi
```

### Restaurar tudo com um único comando

```powershell
chezmoi init --apply https://github.com/httpSnooow/dotfiles.git
```

Isso vai clonar o repositório e aplicar todos os configs na máquina automaticamente.

---

## 🔄 Fluxo de trabalho

```powershell
# Editar um arquivo gerenciado
chezmoi edit ~/.wezterm.lua

# Ver o que mudou antes de aplicar
chezmoi diff

# Aplicar mudanças
chezmoi apply -v

# Salvar no GitHub
chezmoi cd
git add .
git commit -m "update: descrição"
git push
```

---

## ⚠️ Windhawk — Restore Manual

O Windhawk armazena o perfil em `C:\ProgramData\Windhawk\` — fora do `$HOME`, portanto fora do escopo automático do chezmoi. O arquivo está salvo em [`windhawk/userprofile.json`](./windhawk/userprofile.json).

**Para restaurar em uma nova máquina:**

1. Instale o [Windhawk](https://windhawk.net)
2. Execute como **Administrador**:

```powershell
Copy-Item ".\windhawk\userprofile.json" "C:\ProgramData\Windhawk\userprofile.json" -Force
```

3. Reinicie o Windhawk — todos os 19 mods serão reimportados.

<details>
<summary>📋 Mods ativos (19)</summary>

| Mod | Descrição |
| :--- | :--- |
| `taskbar-vertical` | Taskbar vertical |
| `taskbar-icon-size` | Tamanho dos ícones |
| `taskbar-start-button-position` | Posição do botão Start |
| `taskbar-dock-animation` | Animação de dock |
| `taskbar-tray-system-icon-tweaks` | Tweaks no system tray |
| `windows-11-taskbar-styler` | Estilo da taskbar |
| `windows-11-start-menu-styler` | Estilo do menu Start |
| `windows-11-start-menu-buttons` | Botões do menu Start |
| `windows-11-notification-center-styler` | Estilo do centro de notificações |
| `windows-11-file-explorer-styler` | Estilo do File Explorer |
| `translucent-windows` | Janelas translúcidas |
| `dark-menus` | Menus escuros |
| `invisible-borders` | Bordas invisíveis |
| `uxtheme-hook` | Hook para temas customizados |
| `icon-resource-redirect` | Redirecionamento de ícones |
| `hide-start-button` | Oculta botão Start original |
| `shell-flyout-positions` | Posição dos flyouts do shell |
| `fix-explorer-white-flash` | Corrige flash branco no Explorer |
| `explorer-details-better-file-sizes` | Melhora exibição de tamanhos de arquivo |

</details>

---

<div align="center">

Made with 🖤 on **Windows 11** by [httpSnooow](https://github.com/httpSnooow)

</div>
