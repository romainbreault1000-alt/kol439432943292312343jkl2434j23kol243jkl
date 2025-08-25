@echo off
openfiles >nul 2>&1 || (
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0""", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B
)

powershell -Command "Clear-Tpm"
powershell -Command "Disable-TpmAutoProvisioning"

sc create ac type= kernel start= auto binPath= "%~dp0ac.sys"

sc start ac
