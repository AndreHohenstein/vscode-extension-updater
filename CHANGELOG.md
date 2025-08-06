# 📝 Changelog

Alle Änderungen an diesem Projekt werden hier dokumentiert.

---

## \[Unreleased]

* Noch keine neuen Änderungen dokumentiert.

---

## \[2025-08-06]

### Added

* Failback-Strategie in Workflows: prüft User-Installation → System-Installation → installiert bei Bedarf via Winget.
* Hinweisblock in README ergänzt (Letzte Änderungen + Verweis auf Changelog).

### Changed

* Chocolatey vollständig entfernt – Workflows setzen jetzt auf vorhandene lokale Installation (User oder System).
* README aktualisiert, neue Struktur und Dokumentation der Failback-Strategie.

---

## \[2025-08-05]

### Added

* Logging in PowerShell-Skripte integriert (CMTrace-kompatibel).
* `install-only.yml` Workflow hinzugefügt (für Schulungszwecke / Demos).

---

## \[2025-08-04]

### Initial

* Projekt gestartet mit `Install-Extensions.ps1` und `Update-Extensions.ps1`.
* Erste README.md und LICENSE.md erstellt.
