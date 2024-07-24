@echo off

taskkill /f /t /im "%1" || (
    taskkill /f /t /im "%1.exe"
)