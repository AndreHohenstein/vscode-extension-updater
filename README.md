# 📦 VSCode Extension Updater

Dieses Projekt automatisiert den **Download und die Installation von Visual Studio Code Extensions** mithilfe von **GitHub Actions** und **PowerShell**.

---

## 🚀 Features
- Automatischer Build und Release von VSIX-Paketen über **GitHub Actions**
- PowerShell-Skript zum **lokalen Installieren und Aktualisieren**
- Funktioniert komplett **On-Premise** (kein Intune oder Azure notwendig)

---

## 📂 Projektstruktur
.github/workflows/   → GitHub Actions Workflow
scripts/             → PowerShell-Skripte
dist/                → Build-Artefakte (z. B. VSIX)
README.md            → Dokumentation

---

## 🔧 Nutzung (lokal)
.\scripts\Update-Extension.ps1 -Repo "USERNAME/vscode-extension-updater"

👉 Das Skript prüft automatisch die neueste Version im GitHub Release und installiert sie in VS Code.

---

## 🤝 Mitmachen
Beiträge und Vorschläge sind willkommen!
- Fork erstellen
- Änderungen machen
- Pull Request schicken

---

## 📜 Lizenz
Dieses Projekt steht unter der **MIT License**. Frei nutzbar, auch für eigene Projekte.
