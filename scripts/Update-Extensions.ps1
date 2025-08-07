param(
    [string]$ExtensionsFile = (Join-Path $PSScriptRoot "extensions.txt"),
    [string]$LogFile = "$env:TEMP\vscode-extensions-update.log"
)

function Write-Log {
    param(
        [string]$Message,
        [ValidateSet("INFO","SUCCESS","WARNING","ERROR")]
        [string]$Level = "INFO",
        [string]$Component = "VSCodeUpdater"
    )

    $time = (Get-Date -Format "HH:mm:ss.fff")
    $date = (Get-Date -Format "MM-dd-yyyy")

    # Mappe Level auf Type (CMTrace kompatibel: 1=Info, 2=Warning, 3=Error, 4=Success)
    switch ($Level) {
        "INFO"    { $type = "1" }
        "WARNING" { $type = "2" }
        "ERROR"   { $type = "3" }
        "SUCCESS" { $type = "4" }
    }

    $logEntry = "<![LOG[$Message]LOG]!><time=`"$time+120`" date=`"$date`" component=`"$Component`" context=`"`" type=`"$type`" thread=`"`" file=`"`">"
    Add-Content -Path $LogFile -Value $logEntry
}

if (!(Test-Path $ExtensionsFile)) {
    Write-Host "❌ Extensions-Datei nicht gefunden: $ExtensionsFile"
    Write-Log -Message "Extensions-Datei nicht gefunden: $ExtensionsFile" -Level "ERROR"
    exit 1
}

$extensions = Get-Content $ExtensionsFile

foreach ($ext in $extensions) {
    if (-not [string]::IsNullOrWhiteSpace($ext)) {
        Write-Host "🔍 Prüfe Extension: $ext"
        Write-Log -Message "Prüfe Extension: $ext" -Level "INFO"

        # Aktuell installierte Version
        $installed = code --list-extensions --show-versions | Where-Object { $_ -like "$ext*" }

        # Neueste Version im Marketplace (simulierte Installation)
        $marketplace = code --install-extension $ext --force --dry-run 2>&1

        if ($marketplace -match "already installed") {
            Write-Host "✅ $ext ist bereits aktuell."
            Write-Log -Message "$ext ist bereits aktuell." -Level "SUCCESS"
        }
        else {
            Write-Host "⬇️ Update verfügbar für $ext – wird installiert..."
            Write-Log -Message "Update verfügbar für $ext – Installation gestartet" -Level "INFO"

            code --install-extension $ext --force

            Write-Host "⚡ $ext wurde aktualisiert."
            Write-Log -Message "$ext wurde erfolgreich aktualisiert." -Level "SUCCESS"
        }
    }
}

Write-Host "🎯 Update-Check abgeschlossen."
Write-Log -Message "Update-Check abgeschlossen." -Level "INFO"
