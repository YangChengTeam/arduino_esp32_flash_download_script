@echo off
setlocal
set mainbin=%~1
set fsbin=%~2
:: wmic /format:list strips trailing spaces (at least for path win32_pnpentity)
for /f "tokens=1* delims==" %%I in ('wmic path win32_pnpentity get caption /format:list ^| find "COM"') do (
    call :setCOM "%%~J"
)

:: end main batch
goto :EOF

:setCOM <WMIC_output_line>

setlocal
set "str=%~1"
set "num=%str:*(COM=%"
set "num=%num:)=%"
if "%num%" neq "1" ( 
start auto.bat %num% %mainbin% %fsbin%
)
endlocal

goto :EOF




