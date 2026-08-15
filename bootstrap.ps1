#Requires -Version 5.1
<#
.SYNOPSIS
    Bootstrap script para restaurar o setup completo em uma máquina nova.

.DESCRIPTION
    Instala Scoop, buckets, apps, aplica dotfiles via chezmoi e instala
    extensões do VSCode/Antigravity IDE. Funciona em Windows 11 limpo.
    Não requer Python, Node ou qualquer runtime externo.

.NOTES
    Repositório: https://github.com/httpSnooow/dotfiles
    Autor: httpSnooow
#>

# ---------------------------------------------------------------------------
# Helpers de output colorido
# ---------------------------------------------------------------------------
function Write-Success { param([string]$msg) Write-Host "  ✅ $msg" -ForegroundColor Green }
function Write-Warn    { param([string]$msg) Write-Host "  ⚠️  $msg" -ForegroundColor Yellow }
function Write-Err     { param([string]$msg) Write-Host "  ❌ $msg" -ForegroundColor Red }
function Write-Step    { param([string]$msg) Write-Host "`n▶ $msg" -ForegroundColor Cyan }
function Write-Header  {
    Write-Host ""
    Write-Host "  ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗" -ForegroundColor Magenta
    Write-Host "  ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝" -ForegroundColor Magenta
    Write-Host "  ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗" -ForegroundColor Magenta
    Write-Host "  ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║" -ForegroundColor Magenta
    Write-Host "  ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║" -ForegroundColor Magenta
    Write-Host "  ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝" -ForegroundColor Magenta
    Write-Host ""
    Write-Host "  Bootstrap — httpSnooow/dotfiles" -ForegroundColor DarkGray
    Write-Host ""
}

# ---------------------------------------------------------------------------
# 0. Verificar elevação de privilégios
# ---------------------------------------------------------------------------
function Assert-Admin {
    $isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(
        [Security.Principal.WindowsBuiltInRole]::Administrator
    )
    if (-not $isAdmin) {
        Write-Warn "Não está rodando como Administrador."
        Write-Host "  Relançando com elevação..." -ForegroundColor DarkGray
        Start-Process powershell "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
        exit
    }
    Write-Success "Rodando como Administrador"
}

# ---------------------------------------------------------------------------
# 1. Instalar Scoop
# ---------------------------------------------------------------------------
function Install-Scoop {
    Write-Step "Verificando Scoop..."
    if (Get-Command scoop -ErrorAction SilentlyContinue) {
        Write-Success "Scoop já está instalado ($(scoop --version | Select-Object -First 1))"
        return
    }
    Write-Host "  Instalando Scoop..." -ForegroundColor DarkGray
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    try {
        Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
        Write-Success "Scoop instalado com sucesso"
    } catch {
        Write-Err "Falha ao instalar o Scoop: $_"
        exit 1
    }
    # Recarregar PATH
    $env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" +
                [System.Environment]::GetEnvironmentVariable("PATH", "User")
}

# ---------------------------------------------------------------------------
# 2. Adicionar buckets necessários
# ---------------------------------------------------------------------------
function Add-ScoopBuckets {
    Write-Step "Configurando buckets do Scoop..."
    $buckets = @("extras", "nerd-fonts", "versions")
    foreach ($bucket in $buckets) {
        $installed = scoop bucket list 2>$null | Where-Object { $_ -match "^$bucket\s" }
        if ($installed) {
            Write-Warn "Bucket '$bucket' já adicionado"
        } else {
            scoop bucket add $bucket 2>$null
            Write-Success "Bucket '$bucket' adicionado"
        }
    }
}

# ---------------------------------------------------------------------------
# 3. Instalar apps via Scoop
# ---------------------------------------------------------------------------
function Install-Apps {
    Write-Step "Instalando aplicativos..."

    # Descobrir packages.json (pode estar no repo local ou usar lista hardcoded)
    $packagesFile = Join-Path $PSScriptRoot ".config\scoop\packages.json"
    if (Test-Path $packagesFile) {
        $packages = Get-Content $packagesFile | ConvertFrom-Json
        $apps = $packages.apps
        Write-Host "  Usando lista de $($apps.Count) pacotes de packages.json" -ForegroundColor DarkGray
    } else {
        Write-Warn "packages.json não encontrado. Usando lista padrão."
        $apps = @(
            @{ Source = "main";       Name = "chezmoi"            },
            @{ Source = "main";       Name = "git"                },
            @{ Source = "main";       Name = "starship"           },
            @{ Source = "main";       Name = "fastfetch"          },
            @{ Source = "main";       Name = "fzf"                },
            @{ Source = "main";       Name = "ripgrep"            },
            @{ Source = "main";       Name = "yazi"               },
            @{ Source = "extras";     Name = "wezterm"            },
            @{ Source = "extras";     Name = "glazewm"            },
            @{ Source = "extras";     Name = "zebar"              },
            @{ Source = "extras";     Name = "whkd"               },
            @{ Source = "extras";     Name = "komorebi"           },
            @{ Source = "extras";     Name = "flow-launcher"      },
            @{ Source = "extras";     Name = "yasb"               },
            @{ Source = "nerd-fonts"; Name = "JetBrainsMono-NF"   },
            @{ Source = "nerd-fonts"; Name = "JetBrainsMono-NF-Mono" }
        )
    }

    $installed = 0; $skipped = 0; $failed = 0
    foreach ($app in $apps) {
        $name = $app.Name
        # Verificar se já está instalado
        $alreadyInstalled = scoop list 2>$null | Where-Object { $_ -match "^\s*$name\s" }
        if ($alreadyInstalled) {
            Write-Warn "Já instalado: $name"
            $skipped++
            continue
        }
        Write-Host "  Instalando $name..." -ForegroundColor DarkGray
        scoop install "$($app.Source)/$name" 2>&1 | Out-Null
        if ($LASTEXITCODE -eq 0) {
            Write-Success "$name instalado"
            $installed++
        } else {
            Write-Err "Falha ao instalar: $name"
            $failed++
        }
    }
    Write-Host ""
    Write-Host "  Apps: $installed instalados | $skipped já existiam | $failed falharam" -ForegroundColor DarkGray
}

# ---------------------------------------------------------------------------
# 4. Aplicar dotfiles com chezmoi
# ---------------------------------------------------------------------------
function Apply-Dotfiles {
    Write-Step "Aplicando dotfiles com chezmoi..."
    $repo = "https://github.com/httpSnooow/dotfiles.git"

    if (-not (Get-Command chezmoi -ErrorAction SilentlyContinue)) {
        Write-Err "chezmoi não encontrado no PATH. Verifique a instalação do Scoop."
        return
    }

    # Verificar se já está inicializado
    $chezmoiSrc = "$env:USERPROFILE\.local\share\chezmoi"
    if (Test-Path $chezmoiSrc) {
        Write-Warn "chezmoi já inicializado. Rodando 'chezmoi update'..."
        chezmoi update -v
    } else {
        Write-Host "  Clonando e aplicando $repo..." -ForegroundColor DarkGray
        chezmoi init --apply $repo
    }

    if ($LASTEXITCODE -eq 0) {
        Write-Success "Dotfiles aplicados com sucesso"
    } else {
        Write-Err "chezmoi retornou erro (código $LASTEXITCODE)"
    }
}

# ---------------------------------------------------------------------------
# 5. Instalar extensões do VSCode e Antigravity IDE
# ---------------------------------------------------------------------------
function Install-Extensions {
    Write-Step "Instalando extensões dos editores..."

    $extensionsFile = Join-Path $env:USERPROFILE ".local\share\chezmoi\AppData\Roaming\Code\User\extensions.json"
    $agyExtFile     = Join-Path $env:USERPROFILE ".local\share\chezmoi\AppData\Roaming\Antigravity IDE\User\extensions.json"

    foreach ($pair in @(
        @{ Editor = "code";    File = $extensionsFile; Name = "VSCode" },
        @{ Editor = "agy";     File = $agyExtFile;     Name = "Antigravity IDE" }
    )) {
        $editorCmd = $pair.Editor
        $editorName = $pair.Name

        if (-not (Get-Command $editorCmd -ErrorAction SilentlyContinue)) {
            Write-Warn "$editorName não encontrado no PATH — pulando extensões."
            continue
        }
        if (-not (Test-Path $pair.File)) {
            Write-Warn "extensions.json não encontrado para $editorName — pulando."
            continue
        }

        $extensions = (Get-Content $pair.File | ConvertFrom-Json).recommendations
        Write-Host "  Instalando $($extensions.Count) extensões no $editorName..." -ForegroundColor DarkGray

        $ok = 0; $fail = 0
        foreach ($ext in $extensions) {
            & $editorCmd --install-extension $ext --force 2>&1 | Out-Null
            if ($LASTEXITCODE -eq 0) { $ok++ } else { $fail++ }
        }
        Write-Success "$editorName: $ok extensões instaladas ($fail falharam)"
    }
}

# ---------------------------------------------------------------------------
# 6. Checklist final — ações manuais necessárias
# ---------------------------------------------------------------------------
function Show-ManualChecklist {
    Write-Host ""
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGray
    Write-Host "  📋 CHECKLIST — Ações manuais necessárias" -ForegroundColor Yellow
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "  [ ] Windhawk — restaurar perfil de mods:" -ForegroundColor White
    Write-Host "      1. Instale o Windhawk: https://windhawk.net" -ForegroundColor DarkGray
    Write-Host "      2. Execute como Admin:" -ForegroundColor DarkGray
    Write-Host "         Copy-Item '.\windhawk\userprofile.json' 'C:\ProgramData\Windhawk\userprofile.json' -Force" -ForegroundColor DarkGray
    Write-Host "      3. Reinicie o Windhawk para reimportar os 24 mods" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "  [ ] Zen Browser — instalar e configurar o tema Nebula:" -ForegroundColor White
    Write-Host "      Os arquivos CSS já foram aplicados pelo chezmoi." -ForegroundColor DarkGray
    Write-Host "      Ative 'toolkit.legacyUserProfileCustomizations.stylesheets' no about:config" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "  [ ] GlazeWM — iniciar na sessão:" -ForegroundColor White
    Write-Host "      Adicione glazewm.exe ao Task Scheduler ou Startup Folder" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "  [ ] Fonte JetBrainsMono Nerd Font — verificar instalação:" -ForegroundColor White
    Write-Host "      scoop install nerd-fonts/JetBrainsMono-NF" -ForegroundColor DarkGray
    Write-Host "      (ou copie manualmente para C:\Users\$env:USERNAME\.wezterm_fonts\)" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "  [ ] Configurar variável YASB_WEATHER_API_KEY (se usar widget de clima):" -ForegroundColor White
    Write-Host "      [System.Environment]::SetEnvironmentVariable('YASB_WEATHER_API_KEY','SUA_CHAVE','User')" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGray
    Write-Host ""
    Write-Success "Bootstrap concluído! Reinicie o PC para aplicar todas as mudanças."
    Write-Host ""
}

# ---------------------------------------------------------------------------
# MAIN
# ---------------------------------------------------------------------------
Write-Header
Assert-Admin
Install-Scoop
Add-ScoopBuckets
Install-Apps
Apply-Dotfiles
Install-Extensions
Show-ManualChecklist
