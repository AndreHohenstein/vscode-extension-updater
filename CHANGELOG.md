# 📜 Changelog – VSCode Extension Updater

Dieses Dokument listet alle wichtigen Änderungen an diesem Projekt chronologisch auf.

---

## [Unreleased]

---

## [1.0.1] – 2025-08-09
### ✨ Erweiterungen & Verbesserungen

#### Hinzugefügt
- ➕ **Neues Skript:** `VSCode-Extension-Manager.ps1`  
  Interaktives PowerShell-Menü für Demo-/Schulungszwecke (`scripts/VSCode-Extension-Manager.ps1`)
- 🎬 **Demo:** Neuer Abschnitt in der README inkl. eingebundenem GIF (Ablage: `assets/VSCode-Extension-Manager.gif`)
- 📝 **Projektstruktur:** In README.md und im Projektstruktur-Block ergänzt
- 🗂️ **Extensions.txt:** In README.md (Projektstruktur + Beschreibung) nun explizit aufgeführt

#### Geändert
- 📄 README.md:  
  - Demo-Abschnitt mit GIF und Menü-Beschreibung ergänzt  
  - Projektstruktur aktualisiert (Assets-Ordner, neue Skripte, Extensions.txt)  
  - Badges/Links geprüft und klickbar gemacht  
  - Kosmetik/Formatierung (z. B. bessere Übersicht bei Extensions und Features)
- ⚙️ Scripts/Logik:
  - Hinweis zu unterschiedlichen Logfiles (`install`/`update`) in Doku/Verwendung  
  - Assets-Ordner für Screenshots und Demo eingeführt

#### Entfernt
- ❌ Nicht verwendet: "Random Facts" im Menü entfernt (zurück zu schlanker, professioneller Demo)

---

## [1.0.0] – 2025-08-07
### 🎉 Erstveröffentlichung

- Projektstruktur definiert mit `scripts` und `.github/workflows`
- Zwei PowerShell-Skripte:
  - `Install-Extensions.ps1`
  - `Update-Extensions.ps1`
- Unterstützung für:
  - Logging (CMTrace-kompatibel)
  - Emoji-Ausgabe für Statusanzeige
  - Failback-Strategie bei VSCode-CLI-Erkennung (User > System > Winget)
- GitHub Action Workflows:
  - `validate-extensions.yml`
  - `build-extensions.yml`
  - `install-only.yml`
- README mit vollständiger Doku
- Lizenz (MIT) eingebunden

### Hinzugefügt
- 📸 Neue Screenshots („GitHub Actions Workflow“, „Update-Extensions.ps1“) im Abschnitt *Screenshots* der README.md hinzugefügt
- 🏷️ Badges für Build, Release, License, Platform und PowerShell-Version am Anfang der README.md ergänzt

### Geändert
- 📄 README.md strukturell und optisch überarbeitet (bessere Lesbarkeit, aktualisiertes Inhaltsverzeichnis)
- ⚙️ Repository-Regeln, Workflows oder Policies wurden aktualisiert/an neue Projektanforderungen angepasst
- **Install-Extensions.ps1** und **Update-Extensions.ps1**: Logfile-Namen/Pfade vereinheitlicht
  - Install-Extensions.ps1 schreibt jetzt nach `$env:TEMP\vscode-extensions-install.log`
  - Update-Extensions.ps1 schreibt jetzt nach `$env:TEMP\vscode-extensions-update.log`

---
