
:: Use this script to create batches of meters with a numeric pattern.

@echo off
cls
title Batch Meters

:userCheck
if "%username%"=="Cyber" (
	goto start
) else (
	echo.
	echo This script was used for quick and easy duplication of meters during the development of this skin. 
	echo.
	echo It appears that you aren't Cyber, so there's really no point in running this.
	echo.
	echo If you still want to run the script, press a key.
	echo Otherwise, you may close this window.
	pause > nul
	goto start
)

:start
echo.
echo Creating meters...
echo If you see any text after this, check the code.

echo. > temp.txt

set temp=1
set temp2=1
set temp3=a
set temp4=1
:loop
(
	echo.
	echo [GetItemName-p%temp4%-i%temp2%]
	echo Measure=Plugin
	echo Plugin=FileView
	echo Path=[AppsFolder]
	echo Type=FileName
	echo Index=%temp%
	echo IgnoreCount=1
	echo Group=Children
	echo.
	echo [GetItemIcon-p%temp4%-i%temp2%]
	echo Measure=Plugin
	echo Plugin=FileView
	echo Path=[AppsFolder]
	echo Type=Icon
	echo IconSize=#iconSize#
	echo Index=%temp%
	echo IgnoreCount=1
	echo Group=Children
	echo IconPath=#@#iconDump\icon1.ico
	echo.
	echo [GetItemPath-p%temp4%-i%temp2%]
	echo Measure=Plugin
	echo Plugin=FileView
	echo Path=[AppsFolder]
	echo Type=FilePath
	echo Index=%temp%
	echo IgnoreCount=1
	echo Group=Children
) >> temp.txt

set /a temp+=1
set /a temp2+=1

::call :updateLetter

if %temp2%==26 set temp2=1&&set /a temp4+=1
if %temp%==251 goto loopEnd
goto loop

:updateLetter
if %temp3%==a set temp3=b&& goto end
if %temp3%==b set temp3=c&& goto end
if %temp3%==c set temp3=d&& goto end
if %temp3%==d set temp3=e&& goto end
if %temp3%==e set temp3=a&&set /a temp2+=1&& goto end

:loopEnd
echo.
pause
exit

:end