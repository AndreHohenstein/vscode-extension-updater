param(
    [string]$ExtensionsFile = (Join-Path $PSScriptRoot "extensions.txt"),
    [string]$LogFile = "$env:TEMP\vscode-extensions-install.log"
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
        Write-Host "🔍 Installiere Extension: $ext"
        Write-Log -Message "Starte Installation von $ext" -Level "INFO"

        try {
            code --install-extension $ext --force
            Write-Host "⚡ $ext wurde installiert/aktualisiert."
            Write-Log -Message "$ext wurde erfolgreich installiert/aktualisiert." -Level "SUCCESS"
        }
        catch {
            Write-Host "❌ Fehler bei Installation von $ext"
            Write-Log -Message "Fehler bei Installation von $ext : $_" -Level "ERROR"
        }
    }
}

Write-Host "🎯 Installation aller Extensions abgeschlossen."
Write-Log -Message "Installation aller Extensions abgeschlossen." -Level "INFO"
