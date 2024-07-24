@echo off
setlocal enabledelayedexpansion

:loop
for /f "tokens=2 delims==" %%A in ('wmic path Win32_Battery get EstimatedChargeRemaining /value ^| find "EstimatedChargeRemaining"') do (
    set "charge=%%A"
)
set /a "charge=!charge!"

if !charge! gtr 80 (
    echo Battery level is above 80%%. Consider unplugging the charger.
    cscript //nologo battery_alert.vbs "Battery Alert" "Battery level is above 80%%. Consider unplugging the charger."
)

if !charge! lss 30 (
    echo Battery level is less than 30%%. Consider plugging in the charger.
    cscript //nologo battery_alert.vbs "Battery Alert" "Battery level is less than 30%%. Consider plugging in the charger."
)

timeout /t 300 /nobreak >nul
goto :loop
