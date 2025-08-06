```
# 📦 VSCode Extension Updater

Dieses Projekt automatisiert den **Download und die Installation von Visual Studio Code Extensions** mithilfe von **GitHub Actions** und **PowerShell**.

---

## 🚀 Features
- Automatischer Build und Release von VSIX-Paketen über **GitHub Actions**
- PowerShell-Skripte zum **lokalen Installieren und Aktualisieren** von Extensions
- Funktioniert komplett **On-Premise** (kein Intune oder Azure notwendig)

---

## 📂 Projektstruktur
.github/workflows/   → GitHub Actions Workflow
scripts/             → PowerShell-Skripte
dist/                → Build-Artefakte (z. B. VSIX)
README.md            → Dokumentation

---

## 🔧 Nutzung (lokal)

```powershell
# Installation aller Extensions
.\scripts\Install-Extensions.ps1

# Nur prüfen und bei Bedarf aktualisieren
.\scripts\Update-Extensions.ps1
```

👉 Beide Skripte lesen die `extensions.txt` im `scripts/`-Ordner aus und arbeiten die Liste automatisch ab.

---

## ⚙️ Skripte

### Übersicht

| Skript-Datei               | Zweck                                                             | Verhalten                                                                                                                                                                                           |
| -------------------------- | ----------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Install-Extensions.ps1** | Installiert alle Extensions aus der `extensions.txt`.             | - Führt `code --install-extension` für jede Extension aus<br>- Erzwingt Installation oder Update, auch wenn schon vorhanden<br>- Meldung: „already installed“ bei aktueller Version                 |
| **Update-Extensions.ps1**  | Prüft, ob Updates verfügbar sind, und installiert nur bei Bedarf. | - Führt `code --install-extension --dry-run` zur Prüfung aus<br>- Wenn aktuell → keine Aktion<br>- Wenn veraltet → installiert die neue Version<br>- Meldung: „✅ aktuell“ oder „⬇️ Update verfügbar“ |

---

## 🤝 Mitmachen
Beiträge und Vorschläge sind willkommen!
- Fork erstellen
- Änderungen machen
- Pull Request schicken

---

## 📜 Lizenz
Dieses Projekt steht unter der **MIT License**.
Siehe [LICENSE.md](./LICENSE.md) für Details.
