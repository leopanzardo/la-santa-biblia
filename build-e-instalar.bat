@echo off
cd /d "%~dp0"

echo Limpiando build...
call flutter clean

echo Generando APK release...
call flutter build apk --release

echo Instalando en el emulador...
call adb install -r build\app\outputs\apk\release\la_santa_biblia.apk

pause
