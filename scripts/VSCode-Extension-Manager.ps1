# VSCode-Extension-Manager.ps1 – Interactive PowerShell Menu for VSCode Extension Updater
function Show-File {
    param($file)
    $filePath = Join-Path $PSScriptRoot $file
    if (Test-Path $filePath) {
        notepad $filePath
    } else {
        Write-Host "File not found: $filePath" -ForegroundColor Yellow
    }
}

function Show-About {
    Write-Host ""
    Write-Host "-----------------------------------------------"
    Write-Host " VSCode Extension Manager – Project Info"
    Write-Host "-----------------------------------------------"
    Write-Host "Author   : André Hohenstein"
    Write-Host "Version  : See CHANGELOG.md"
    Write-Host "License  : MIT"
    Write-Host ""
    Write-Host "GitHub Repo : https://github.com/AndreHohenstein/vscode-extension-updater"
    Write-Host "Feedback    : a.hohenstein@outlook.com"
    Write-Host ""
    Write-Host "For more information, see the README.md and the Discussions section on GitHub."
    Write-Host "-----------------------------------------------"
}

do {
    Clear-Host
Write-Host ""
Write-Host "🚀 VSCode Extension Manager" -ForegroundColor Magenta
Write-Host "--------------------------------------`n"

Write-Host "1. 🚀  Install extensions (fresh setup)"
Write-Host "2. ♻️  Update extensions (check for updates)"
Write-Host "3. 📄  Show update log"
Write-Host "4. 📂  Open project page on GitHub"
Write-Host "5. 📘  Show README on GitHub"
Write-Host "6. 📝  Show CHANGELOG on GitHub"
Write-Host "7. 📜  Show LICENSE on GitHub"
Write-Host "8. 💬  About & Feedback"
Write-Host "9. ❌  Exit"
Write-Host ""

    $choice = Read-Host "Please select an option (1-9)"
    switch ($choice) {
    1 {
        # Install extensions
        & "$PSScriptRoot\Install-Extensions.ps1"
        Pause
    }
    2 {
        # Update extensions
        & "$PSScriptRoot\Update-Extensions.ps1"
        Pause
    }
    3 {
        # Show update log (optional: lokalen Pfad, hier als Beispiel)
        $logPath = "$env:TEMP\VscodeExtensionsUpdater.log"
        if (Test-Path $logPath) {
            notepad $logPath
        } else {
            Write-Host "No log file found at $logPath" -ForegroundColor Yellow
        }
        Pause
    }
    4 {
        # Open project page on GitHub
        Start-Process "https://github.com/AndreHohenstein/vscode-extension-updater"
        Pause
    }
    5 {
        # Show README on GitHub
        Start-Process "https://github.com/AndreHohenstein/vscode-extension-updater/blob/main/README.md"
        Pause
    }
    6 {
        # Show CHANGELOG on GitHub
        Start-Process "https://github.com/AndreHohenstein/vscode-extension-updater/blob/main/CHANGELOG.md"
        Pause
    }
    7 {
        # Show LICENSE on GitHub
        Start-Process "https://github.com/AndreHohenstein/vscode-extension-updater/blob/main/LICENSE.md"
        Pause
    }
    8 {
        # About & Feedback
        Write-Host "Project by André Hohenstein (Microsoft Certified Trainer)" -ForegroundColor Cyan
        Write-Host "Feedback: https://github.com/AndreHohenstein/vscode-extension-updater/issues"
        Pause
    }
    9 {
        exit
    }
    Default {
        Write-Host "Invalid selection. Please try again." -ForegroundColor Red
        Pause
    }
 }
} while ($choice -ne '9')
