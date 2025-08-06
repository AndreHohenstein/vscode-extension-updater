# 📦 VSCode Extension Updater

Dieses Projekt automatisiert den **Download und die Installation von Visual Studio Code Extensions** mithilfe von **GitHub Actions** und **PowerShell**.

---

## 🚀 Features

* Automatischer Build und Release von VSIX-Paketen über **GitHub Actions**
* PowerShell-Skripte zum **lokalen Installieren und Aktualisieren** von Extensions
* CMTrace-kompatibles Logging für bessere Nachvollziehbarkeit
* GitHub Actions Workflows zur automatischen Validierung und Demo-Nutzung
* Funktioniert komplett **On-Premise** (kein Intune oder Azure notwendig), aber erweiterbar für Cloud-Szenarien
* **Keine Abhängigkeit von Chocolatey** – entspricht einer normalen lokalen Installation von Visual Studio Code

---

## 📂 Projektstruktur

* `.github/workflows/` → GitHub Actions Workflows
* `scripts/` → PowerShell-Skripte + Extension-Liste
* `dist/` → Build-Artefakte (z. B. VSIX)
* `README.md` → Dokumentation
* `LICENSE.md` → Lizenzinformationen

---

## 🔧 Nutzung (lokal)

```powershell
# Installation aller Extensions
.\scripts\Install-Extensions.ps1

# Nur prüfen und bei Bedarf aktualisieren
.\scripts\Update-Extensions.ps1
```

👉 Beide Skripte lesen die `extensions.txt` im `scripts/`-Ordner aus und arbeiten die Liste automatisch ab.
👉 Alle Aktionen werden zusätzlich in ein Logfile geschrieben (`$env:TEMP\\VscodeExtensionsUpdater.log`), das **CMTrace-kompatibel** ist.

---

## ⚙️ Skripte

### Übersicht

* **Install-Extensions.ps1** → Installiert alle Extensions aus der `extensions.txt`.
* **Update-Extensions.ps1** → Prüft, ob Updates verfügbar sind und aktualisiert bei Bedarf.

### 📜 Details zu Install-Extensions.ps1

* Führt `code --install-extension` für jede Extension aus
* Erzwingt Installation oder Update, auch wenn schon vorhanden
* Meldung: „already installed“ bei aktueller Version
* Schreibt Logeinträge (INFO / SUCCESS / ERROR) in Logfile

### 📜 Details zu Update-Extensions.ps1

* Führt `code --install-extension --dry-run` zur Prüfung aus
* Meldung: „✅ aktuell“ oder „⬇️ Update verfügbar“
* Installiert neue Version nur bei Bedarf
* Schreibt Logeinträge (INFO / SUCCESS / ERROR) in Logfile

---

## 🤖 GitHub Actions Workflows

### Übersicht

* **validate-extensions.yml**

  * Testet `Install-Extensions.ps1` **und** `Update-Extensions.ps1` in frischer Windows-Umgebung
  * Prüft die `extensions.txt` auf Gültigkeit
  * Nutzt vorhandene VS Code Installation (kein Chocolatey)
  * Trigger: Automatisch bei Änderungen in `scripts/*.ps1` oder `scripts/extensions.txt`, manuell über GitHub UI

* **install-only.yml**

  * Führt nur `Install-Extensions.ps1` aus – ideal als **Schulungs-Demo**
  * Nutzt vorhandene VS Code Installation (kein Chocolatey)
  * Trigger: Manuell über GitHub UI (`workflow_dispatch`)

* **build-extension.yml**

  * Simuliert den Build-Prozess für Extensions (z. B. `.vsix`)
  * Nutzt vorhandene VS Code Installation (kein Chocolatey)
  * Trigger: Automatisch bei Push auf `main` oder manuell über GitHub UI

---

## 🤝 Mitmachen

Beiträge und Vorschläge sind willkommen!

* Fork erstellen
* Änderungen machen
* Pull Request schicken

---

## 📜 Lizenz

Dieses Projekt steht unter der **MIT License**.
👉 Siehe [LICENSE.md](LICENSE.md) für Details.
