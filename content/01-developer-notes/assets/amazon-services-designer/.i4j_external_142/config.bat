if not exist desinstalador.exe goto end
del uninstall.exe
ren desinstalador.exe uninstall.exe
del config.bat
:end
