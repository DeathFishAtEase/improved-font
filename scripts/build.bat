@echo off
setlocal

set "ROOT=%~dp0.."
set "ARCH=%PROCESSOR_ARCHITECTURE%"
if defined PROCESSOR_ARCHITEW6432 set "ARCH=%PROCESSOR_ARCHITEW6432%"

set "BIN=%ROOT%\ra2fnt\ra2fnt-windows-amd64.exe"
if /I "%ARCH%"=="ARM64" set "BIN=%ROOT%\ra2fnt\ra2fnt-windows-arm64.exe"

if not exist "%BIN%" (
  echo ra2fnt binary not found: "%BIN%"
  exit /b 1
)

"%BIN%" create -in "%ROOT%\src" -out "%ROOT%\game.fnt"
if errorlevel 1 exit /b %errorlevel%
