# 📜 Changelog – VSCode Extension Updater

Dieses Dokument listet alle wichtigen Änderungen an diesem Projekt chronologisch auf.

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
