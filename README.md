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

## 📸 Screenshots

> *Adicione screenshots em `assets/screenshots/` e atualize esta seção.*

![Desktop](./assets/screenshots/desktop.png)

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

![Windhawk](https://img.shields.io/badge/Windhawk-24_mods-F59E0B?style=for-the-badge&logoColor=white)
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
| **Editor** | VSCode | `AppData/Roaming/Code/User/settings.json` + `extensions.json` |
| **Editor** | Antigravity IDE | `settings.json` + `keybindings.json` + `extensions.json` |
| **System** | Windhawk | `userprofile.json` — 24 mods ativos *(ver nota abaixo)* |
| **Package** | Scoop | `.config/scoop/config.json` + `packages.json` |
| **Colors** | Paleta global | `.config/colors/palette.yaml` |
| **Bootstrap** | Script de restore | `bootstrap.ps1` |

---

## ⚡ Instalação

### 🚀 Método preferido — bootstrap completo

Em uma instalação limpa do Windows 11, abra o **PowerShell** e execute:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
irm https://raw.githubusercontent.com/httpSnooow/dotfiles/main/bootstrap.ps1 | iex
```

O script cuida de tudo: instala Scoop, todos os apps, aplica os dotfiles via chezmoi e instala as extensões dos editores.

### Manual — passo a passo

```powershell
# 1. Instalar Scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

# 2. Instalar chezmoi
scoop install chezmoi

# 3. Restaurar dotfiles
chezmoi init --apply https://github.com/httpSnooow/dotfiles.git
```

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

## ⌨️ Keybindings

### GlazeWM

| Atalho | Ação |
| :--- | :--- |
| `Alt + H/J/K/L` | Mover foco ← ↓ ↑ → |
| `Alt + ←/↓/↑/→` | Mover foco (arrow keys) |
| `Alt + Shift + H/J/K/L` | Mover janela ← ↓ ↑ → |
| `Alt + Enter` | Abrir WezTerm |
| `Alt + Shift + Q` | Fechar janela |
| `Alt + F` | Toggle fullscreen |
| `Alt + T` | Toggle tiling |
| `Alt + Shift + Space` | Toggle floating |
| `Alt + M` | Minimizar janela |
| `Alt + V` | Alternar direção de tiling |
| `Alt + R` | Entrar em modo resize |
| `Alt + U/I/O/P` | Redimensionar janela |
| `Alt + 1–9` | Focar workspace 1–9 |
| `Alt + Shift + 1–9` | Mover janela para workspace 1–9 |
| `Alt + S / Alt + A` | Próximo / anterior workspace |
| `Alt + D` | Workspace recente |
| `Alt + Shift + R` | Recarregar config |
| `Alt + Shift + E` | Sair do GlazeWM |
| `Alt + Shift + P` | Toggle modo pause |

### whkd (Komorebi)

| Atalho | Ação |
| :--- | :--- |
| `Alt + Q` | Fechar janela (`komorebic close`) |
| `Alt + F` | Toggle float (`komorebic toggle-float`) |
| `Alt + Return` | Abrir terminal |
| `Alt + ←/↓/↑/→` | Mover foco entre janelas |
| `Alt + Shift + ←/↓/↑/→` | Mover janela |

---

## 🎨 Color Palette

Paleta centralizada em [`.config/colors/palette.yaml`](./.config/colors/palette.yaml).  
Baseada em **Rose Pine** com customizações do tema Nebula (Zen Browser) e WezTerm.

### Base

| Nome | Hex | Preview | Uso |
| :--- | :--- | :---: | :--- |
| `background` | `#0c0b0f` | ![#0c0b0f](https://via.placeholder.com/16/0c0b0f/0c0b0f.png) | WezTerm bg, tab bar |
| `surface` | `#1a1720` | ![#1a1720](https://via.placeholder.com/16/1a1720/1a1720.png) | Painéis, cards |
| `overlay` | `#26222f` | ![#26222f](https://via.placeholder.com/16/26222f/26222f.png) | Modais, menus |
| `muted` | `#6e6a86` | ![#6e6a86](https://via.placeholder.com/16/6e6a86/6e6a86.png) | Comentários, ícones inativos |
| `text` | `#f8f2f5` | ![#f8f2f5](https://via.placeholder.com/16/f8f2f5/f8f2f5.png) | Texto principal |
| `subtle` | `#908caa` | ![#908caa](https://via.placeholder.com/16/908caa/908caa.png) | Delimitadores |

### Acentos

| Nome | Hex | Preview | Uso |
| :--- | :--- | :---: | :--- |
| `rose` ⭐ | `#bea3c7` | ![#bea3c7](https://via.placeholder.com/16/bea3c7/bea3c7.png) | **Acento primário** — cursor, border ativo |
| `iris` | `#c4a7e7` | ![#c4a7e7](https://via.placeholder.com/16/c4a7e7/c4a7e7.png) | Keywords, funções |
| `foam` | `#9ccfd8` | ![#9ccfd8](https://via.placeholder.com/16/9ccfd8/9ccfd8.png) | Links, info |
| `pine` | `#31748f` | ![#31748f](https://via.placeholder.com/16/31748f/31748f.png) | Sucesso, git add |
| `gold` | `#f6c177` | ![#f6c177](https://via.placeholder.com/16/f6c177/f6c177.png) | Warnings, git mod |
| `love` | `#eb6f92` | ![#eb6f92](https://via.placeholder.com/16/eb6f92/eb6f92.png) | Erros, git del |

---

## ⚠️ Windhawk — Restore Manual

O Windhawk armazena o perfil em `C:\ProgramData\Windhawk\` — fora do `$HOME`, portanto fora do escopo automático do chezmoi. O arquivo está salvo em [`windhawk/userprofile.json`](./windhawk/userprofile.json).

**Para restaurar em uma nova máquina:**

1. Instale o [Windhawk](https://windhawk.net)
2. Execute como **Administrador**:

```powershell
Copy-Item ".\windhawk\userprofile.json" "C:\ProgramData\Windhawk\userprofile.json" -Force
```

3. Reinicie o Windhawk — todos os 24 mods serão reimportados.

<details>
<summary>📋 Mods ativos (24)</summary>

| Mod | Descrição |
| :--- | :--- |
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

---

<div align="center">

Made with 🖤 on **Windows 11** by [httpSnooow](https://github.com/httpSnooow)

</div>
