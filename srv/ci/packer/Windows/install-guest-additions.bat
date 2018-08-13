if "%PACKER_BUILDER_TYPE%" equ "virtualbox-iso" goto :virtualbox
if "%PACKER_BUILDER_TYPE%" equ "parallels-iso" goto :hyperv
goto :done

:virtualbox
cmd /c for %%i in (E:\cert\vbox*.cer) do E:\cert\VBoxCertUtil add-trusted-publisher %%i --root %%i
cmd /c E:\VBoxWindowsAdditions.exe /S
goto :done

:hyperv
if exist "C:\Users\vagrant\prl-tools-win.iso" (
	REM move /Y C:\Users\vagrant\prl-tools-win.iso C:\Windows\Temp
	REM cmd /C "C:\Program Files\7-Zip\7z.exe" x C:\Windows\Temp\prl-tools-win.iso -oC:\Windows\Temp\parallels
	REM cmd /C C:\Windows\Temp\parallels\PTAgent.exe /install_silent
	REM rd /S /Q "c:\Windows\Temp\parallels"
    REM cmd /c for %%i in (E:\cert\vbox*.cer) do E:\cert\VBoxCertUtil add-trusted-publisher %%i --root %%i
    REM cmd /c E:\VBoxWindowsAdditions.exe /S
)
goto :done

:done