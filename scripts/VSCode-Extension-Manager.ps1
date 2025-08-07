# VSCode-Extension-Manager.ps1 – Interactive PowerShell Menu with Smart Logfile Viewer

function Open-LogFile {
    param($logPath)

    if (-not (Test-Path $logPath)) {
        Write-Host "No log file found at $logPath" -ForegroundColor Yellow
        Pause
        return
    }

    # Try CMTrace (Microsoft Diagnostics Tool)
    $cmtracePaths = @(
        "$env:WINDIR\CCM\CMTrace.exe",
        "$env:ProgramFiles\ConfigMgr 2012 Toolkit R2\ClientTools"
    )
    foreach ($cmtrace in $cmtracePaths) {
        if (Test-Path $cmtrace) {
            Start-Process $cmtrace -ArgumentList "`"$logPath`""
            return
        }
    }

    # Try Notepad++
    $npp = "$env:ProgramFiles\Notepad++\notepad++.exe"
    if (Test-Path $npp) {
        Start-Process $npp -ArgumentList "`"$logPath`""
        return
    }
    $npp86 = "$env:ProgramFiles(x86)\Notepad++\notepad++.exe"
    if (Test-Path $npp86) {
        Start-Process $npp86 -ArgumentList "`"$logPath`""
        return
    }

    # Fallback: Classic Notepad
    Start-Process "$env:WINDIR\notepad.exe" -ArgumentList "`"$logPath`""
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
    Write-Host "3. 📄  Show installation log"
    Write-Host "4. 📄  Show update log"
    Write-Host "5. 📂  Open project page on GitHub"
    Write-Host "6. 📘  Show README on GitHub"
    Write-Host "7. 📝  Show CHANGELOG on GitHub"
    Write-Host "8. 📜  Show LICENSE on GitHub"
    Write-Host "9. 💬  About & Feedback"
    Write-Host "0. ❌  Exit"
    Write-Host ""

    $choice = Read-Host "Please select an option (0-9)"
    switch ($choice) {
        1 {
            & "$PSScriptRoot\Install-Extensions.ps1"
            Pause
        }
        2 {
            & "$PSScriptRoot\Update-Extensions.ps1"
            Pause
        }
        3 {
            # Show installation log (uses smart log viewer)
            $logPath = "$env:TEMP\vscode-extensions-install.log"
            Open-LogFile $logPath
            Pause
        }
        4 {
            # Show update log (uses smart log viewer)
            $logPath = "$env:TEMP\vscode-extensions-update.log"
            Open-LogFile $logPath
            Pause
        }
        5 {
            Start-Process "https://github.com/AndreHohenstein/vscode-extension-updater"
            Pause
        }
        6 {
            Start-Process "https://github.com/AndreHohenstein/vscode-extension-updater/blob/main/README.md"
            Pause
        }
        7 {
            Start-Process "https://github.com/AndreHohenstein/vscode-extension-updater/blob/main/CHANGELOG.md"
            Pause
        }
        8 {
            Start-Process "https://github.com/AndreHohenstein/vscode-extension-updater/blob/main/LICENSE.md"
            Pause
        }
        9 {
            Show-About
            Pause
        }
        0 {
            exit
        }
        Default {
            Write-Host "Invalid selection. Please try again." -ForegroundColor Red
            Pause
        }
    }
} while ($choice -ne '0')
