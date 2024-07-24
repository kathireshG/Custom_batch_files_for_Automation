@echo off

taskkill /f /t /im "%1" || (
    taskkill /f /t /im "%1.exe"
)

echo.
echo Attempting to start %1
echo.

start %1 && echo Started %1 