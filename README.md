
# 🚀 VSCode Extension Updater

![Build](https://github.com/AndreHohenstein/vscode-extension-updater/actions/workflows/validate-extensions.yml/badge.svg)
![Release](https://img.shields.io/github/v/release/AndreHohenstein/vscode-extension-updater?label=Release)
![License](https://img.shields.io/github/license/AndreHohenstein/vscode-extension-updater)
![Platform](https://img.shields.io/badge/Platform-Windows-blue?logo=windows)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1%20%7C%20Core-5391FE?logo=powershell)
[![Discuss on GitHub](https://img.shields.io/badge/Discuss-GitHub%20Discussions-blue?logo=github)](https://github.com/AndreHohenstein/vscode-extension-updater/discussions)

Ein automatisiertes PowerShell-Tool zur Verwaltung und Aktualisierung von Visual Studio Code-Erweiterungen – inklusive GitHub Actions-Workflows, Logging, Failback-Strategien und Schulungsbeispielen.

---

## 📝 Inhaltsverzeichnis

- [🚀 Projektüberblick](#-projektüberblick)
- [📸 Screenshots](#-screenshots)
- [🎬 Demo: Interaktives Menü](#-demo-interaktives-menü)
- [⚙️ Installation](#️-installation)
- [🚀 Verwendung](#-verwendung)
- [✨ Features & Highlights](#-features--highlights)
- [🧰 Voraussetzungen](#-voraussetzungen)
- [📁 Projektstruktur](#-projektstruktur)
- [🗂️ Enthaltene Extensions](#️-enthaltene-extensions)
- [🔄 GitHub Workflows](#-github-workflows)
- [📜 Lizenz](#-lizenz)
- [🧾 Changelog](#-changelog)
- [💬 Feedback & Support](#-feedback--support)

---

## 🚀 Projektüberblick

Dieses Projekt bietet zwei PowerShell-Skripte zur Verwaltung von VS Code Extensions:

- [`Install-Extensions.ps1`](./scripts/Install-Extensions.ps1) – für die initiale Installation definierter Erweiterungen
- [`Update-Extensions.ps1`](./scripts/Update-Extensions.ps1) – für die automatische Update-Prüfung & Installation
- **Interaktives Menü:** [`VSCode-Extension-Manager.ps1`](./scripts/VSCode-Extension-Manager.ps1) – ideal für Demo/Training, siehe unten!

Die GitHub Workflows ermöglichen es zusätzlich, diese Logik im CI/CD-Kontext auszuführen – z. B. für Schulungen, Demos, automatisierte Tests oder Entwicklungsszenarien.

---

## 📸 Screenshots

### 1. GitHub Actions Workflow (Validierung & Test)

![GitHub Actions Workflow](./assets/GitHubActions.png)

---

### 2. PowerShell-Terminal: Update-Extensions.ps1

![Update Extensions PowerShell](./assets/Update-Extensions.png)

---

## 🎬 Demo: Interaktives Menü

Das Skript [`VSCode-Extension-Manager.ps1`](./scripts/VSCode-Extension-Manager.ps1) bietet ein komfortables, menügesteuertes Interface zur Installation, Aktualisierung und Protokollanzeige der Extensions.  
**Ideal als Demo für Schulungszwecke oder Admin-Tool.**

![VSCode-Extension-Manager GIF](./assets/VSCode-Extension-Manager.gif)

---

## ⚙️ Installation

Die Installation erfolgt manuell durch das Klonen des Repositories und Ausführen der Skripte.

```powershell
# Repository klonen
git clone https://github.com/AndreHohenstein/vscode-extension-updater.git
cd vscode-extension-updater/scripts

# PowerShell-Skripte ausführen
./Install-Extensions.ps1
./Update-Extensions.ps1
./VSCode-Extension-Manager.ps1
```

---

## 🚀 Verwendung

```powershell
# Extensions installieren (z. B. nach Clean-Setup oder auf Testsystem)
./Install-Extensions.ps1 -LogPath "$env:TEMP\\vscode-extensions-install.log"

# Extensions aktualisieren
./Update-Extensions.ps1 -LogPath "$env:TEMP\\vscode-extensions-update.log"

# Interaktives Menü (empfohlen für Demos)
./VSCode-Extension-Manager.ps1
```

---

## ✨ Features & Highlights

| Symbol | Funktion                                   |
| ------ | ------------------------------------------ |
| 🔍     | Prüfen installierter Erweiterungen         |
| ⚡      | Automatisches Update veralteter Add-ons    |
| 🗒️    | CMTrace-kompatibles Logging                |
| 🤖     | GitHub Actions Workflows                   |
| 🧪     | Demo-Workflow für Schulungen               |
| 🧰     | Failback-Strategie: User → System → Winget |
| 🖥️     | Interaktives PowerShell-Menü              |

---

## 🧰 Voraussetzungen

- Windows 10/11 mit PowerShell 5.1 oder höher
- Visual Studio Code lokal installiert (User- oder System-Installer)
- Git (für Repository-Zugriff)

Optional:

- Winget (für Failback-Funktion, falls VS Code nicht vorhanden ist)

---

## 📁 Projektstruktur

```plaintext
📁 scripts
 ├── 📜 Install-Extensions.ps1
 ├── 📜 Update-Extensions.ps1
 ├── 📜 VSCode-Extension-Manager.ps1
 └── 📄 extensions.txt

📁 .github/workflows
 ├── 🧪 install-only.yml
 ├── ⚙️ build-extensions.yml
 └── ✅ validate-extensions.yml

📁 assets
 ├── GitHubActions.png
 ├── Update-Extensions.png
 └── VSCode-Extension-Manager.gif

📜 README.md
📜 LICENSE.md
📜 CHANGELOG.md
```

---

## 🗂️ Enthaltene Extensions

Die zu installierenden Erweiterungen werden in der Datei [`extensions.txt`](./scripts/extensions.txt) verwaltet.  
**Beispiel-Auszug:**

```text
ms-ceintl.vscode-language-pack-de
ms-vscode.powershell
github.vscode-pull-request-github
eamodio.gitlens
akamud.vscode-theme-onedark
PKief.material-icon-theme
enkia.tokyo-night
...
```
> *Die vollständige Liste kann flexibel angepasst werden!*

---

## 🔄 GitHub Workflows

Die folgenden Workflows unterstützen automatisiertes Testen und Validieren:

| Workflow-Datei            | Beschreibung                             |
| ------------------------- | ---------------------------------------- |
| [`validate-extensions.yml`](./.github/workflows/validate-extensions.yml) | Prüft das Update-Skript im GitHub Runner |
| [`build-extensions.yml`](./.github/workflows/build-extensions.yml)      | Validiert Build-Szenarien & CLI-Pfade    |
| [`install-only.yml`](./.github/workflows/install-only.yml)              | Demo-Workflow für Trainingsumgebungen    |

---

## 📜 Lizenz

Dieses Projekt steht unter der [MIT-Lizenz](./LICENSE.md). Frei verwendbar – auch für eigene Projekte & Schulungsunterlagen.

---

## 🧾 Changelog

Alle Änderungen werden im [CHANGELOG.md](./CHANGELOG.md) dokumentiert.

---

## 💬 Feedback & Support

💬 **Mitdiskutieren erwünscht!**

Du hast Fragen, Feedback, Ideen oder möchtest dich austauschen?  
Nutze den [Discussions-Bereich](https://github.com/AndreHohenstein/vscode-extension-updater/discussions) und werde Teil der Community!

Für Fragen, Verbesserungsvorschläge oder Rückmeldungen:

📧 E-Mail: a.hohenstein@outlook.com  
📢 GitHub Issues: [Projekt-Issuebereich öffnen](https://github.com/AndreHohenstein/vscode-extension-updater/issues)  
👨‍🏫 Einsatz für Schulungen & Community willkommen!

---

© 2025 André Hohenstein – Microsoft Certified Trainer 💻
