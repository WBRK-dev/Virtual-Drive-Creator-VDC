@echo off

set VERSION=1.0.2

title Virtual Drive Creator
cd C:\Users\%username%\Documents\VDC

for /f "Delims=" %%a in (config.txt) do (
set config=%%a
)
if %config%==1 (
echo Getting things ready.
) else (
echo 1 > config.txt
echo None > Drive.txt
)
goto versioncheck
:start
Cls
echo Virtual Drive Creator
echo.

for /f "Delims=" %%a in (Drive.txt) do (
set DRIVE=%%a
)

echo Current Drive: %DRIVE%
echo.
echo Create Virtual Drive
echo Delete Virtual Drive
echo Change Virtual Drive Location
echo.

if not %VERSIONGET%==%VERSION% (
echo There is an update available.
echo Please install the update here: https://koertsprojects.netlify.app/projects/vdc
echo.
)


echo Enter the thing to do.
echo Example: Create Virtual Drive
set /P PROGRAM="> "
goto %PROGRAM%

:Create Virtual Drive
Cls
if %DRIVE%==None (
echo Please enter a drive for the Virtual Drive.
pause
goto start
)
echo Virtual Drive Creator
echo.

if not %VERSIONGET%==%VERSION% (
echo There is an update available.
echo Please install the update here: https://koertsprojects.netlify.app/projects/vdc
echo.
)

echo Please enter the drive letter for the Virtual Drive.
echo Example: A
set /p DRIVELETTER="> "
echo Creating Virtual Drive.
subst %DRIVELETTER%: %DRIVE%
echo Virtual Drive Created.
pause
goto start

:Delete Virtual Drive
Cls
if %DRIVE%==None (
echo Please enter a drive for the Virtual Drive.
pause
goto start
)
echo Virtual Drive Creator
echo.

if not %VERSIONGET%==%VERSION% (
echo There is an update available.
echo Please install the update here: https://koertsprojects.netlify.app/projects/vdc
echo.
)

echo Please enter the drive letter to delete the Virtual Drive.
echo Example: A
set /P DRIVELETTERD="> "
echo Deleting Drive letter %DRIVELETTERD%.
subst %DRIVELETTERD%: /D
echo %DRIVELETTERD% has been deleted.
pause
goto start

:Change Virtual Drive Location
Cls
echo Virtual Drive Creator
echo.

if not %VERSIONGET%==%VERSION% (
echo There is an update available.
echo Please install the update here: https://koertsprojects.netlify.app/projects/vdc
echo.
)

echo Please enter the drive location for the Virtual Drive.
echo Example: C:\Users\username\Desktop\Games
set /p DRIVEC="> "
echo Creating Drive to Virtual Drive.
echo %DRIVEC% > Drive.txt
echo Created.
pause
goto start

:versioncheck
echo Checking for updates.
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://koertsprojects.netlify.app/projects/files/products/vdcversion.txt', 'version.txt')"
powershell -Command "Invoke-WebRequest https://koertsprojects.netlify.app/projects/files/products/vdcversion.txt -OutFile version.txt"

for /f "Delims=" %%a in (version.txt) do (
set VERSIONGET=%%a
)

goto start


:config0
echo Creating config file.
echo 0 > config.txt
echo Config file created.
echo The program will close.
timeout /T 4
