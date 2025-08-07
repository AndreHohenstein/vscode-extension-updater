# 📜 Changelog – VSCode Extension Updater

Dieses Dokument listet alle wichtigen Änderungen an diesem Projekt chronologisch auf.

---
## [Unreleased]

### Hinzugefügt
- 📸 Neue Screenshots („GitHub Actions Workflow“, „Update-Extensions.ps1“) im Abschnitt *Screenshots* der README.md hinzugefügt
- 🏷️ Badges für Build, Release, License, Platform und PowerShell-Version am Anfang der README.md ergänzt

### Geändert
- 📄 README.md strukturell und optisch überarbeitet (bessere Lesbarkeit, aktualisiertes Inhaltsverzeichnis)
- ⚙️ Repository-Regeln, Workflows oder Policies wurden aktualisiert/an neue Projektanforderungen angepasst



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
