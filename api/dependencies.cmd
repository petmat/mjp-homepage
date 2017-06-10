@echo off

if not exist .paket (
    @echo "Installing Paket"
    mkdir .paket
    powershell -Command "curl -Uri https://github.com/fsprojects/Paket/releases/download/3.32.2/paket.bootstrapper.exe -OutFile .paket\paket.bootstrapper.exe"

    call .paket\paket.bootstrapper.exe
    if errorlevel 1 (
        exit /b %errorlevel%
    )
)

if not exist paket.lock (
    @echo "Installing dependencies"
    call .paket\paket.exe install
) else (
    @echo "Restoring dependencies"
    call .paket\paket.exe restore
)