@echo off
setlocal

:: Set your service name here
set ServiceName=EarlyLoader

:: Driver file path relative to system root
set DriverPath=System32\drivers\NSIH.sys

echo Creating registry entries for %ServiceName%...

:: Create registry key for the service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceName%" /f

:: Set ImagePath (driver file)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceName%" /v ImagePath /t REG_EXPAND_SZ /d "%DriverPath%" /f

:: Set Type = 1 (Kernel Driver)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceName%" /v Type /t REG_DWORD /d 1 /f

:: Set Start = 0 (Boot start)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceName%" /v Start /t REG_DWORD /d 0 /f

:: Set ErrorControl = 1 (Normal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceName%" /v ErrorControl /t REG_DWORD /d 1 /f

:: Set Group = Boot Bus Extender (optional for early load)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%ServiceName%" /v Group /t REG_SZ /d "Boot Bus Extender" /f


endlocal
