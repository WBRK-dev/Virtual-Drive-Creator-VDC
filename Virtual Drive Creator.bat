::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBBbSRaWAE+1EbsQ5+n//Naxq18JQeMzOKfayLDOBPIa/ECqfJUitg==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFBBbSRaWAE+/Fb4I5/jHy+uTo3E8RPIsRLn/+Yi4KfIH/0ToNbI/32xf2OgeCRpMcQDlaxcxyQ==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off

set VERSION=1.0.0






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

if %VERSIONGET%==%VERSION% (
echo No updates available.
goto start
) else (
echo There is a update available. (%VERSIONGET%)
pause
start https://koertsprojects.netlify.app/projects/vdc
exit
)


:config0
echo Creating config file.
echo 0 > config.txt
echo Config file created.
echo The program will close.
timeout /T 4