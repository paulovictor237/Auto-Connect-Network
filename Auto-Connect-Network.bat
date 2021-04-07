@ECHO off
cls
REM wmic nic where "netconnectionid like '%'" get netconnectionid
REM netsh wlan show profiles
REM netsh wlan show networks
:start
ECHO.
ECHO 1. Static IP
ECHO 2. Dynamic IP
ECHO 2. Dynamic DNS
ECHO 3. Obtain an IP address automatically
ECHO 4. Exit
set choice=
set /p choice=Type the number to print text.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto con1
if '%choice%'=='2' goto con2
if '%choice%'=='2' goto con3
if '%choice%'=='3' goto autosearch
if '%choice%'=='4' goto end
ECHO "%choice%" is not valid, try again
ECHO.
goto start

:con1
ECHO Connecting Connection 1
netsh interface ip set address "Wi-Fi" static 192.168.1.239 255.255.255.0 192.168.0.1 1
netsh wlan connect name="TP-Link_53BA" interface="Wi-Fi"
goto end

:con2
ECHO Connecting Connection 2
netsh interface ip set address "Wi-Fi" dhcp
netsh wlan connect name="Pollux" interface="Wi-Fi"
goto end

:con2
ECHO Connecting Connection 3
netsh interface ip set dns "Wi-Fi" dhcp
goto end

:autosearch
ECHO obtaining auto IP
ipconfig /renew "Wi-Fi"
goto end

:bye
ECHO BYE
goto end

:end

pause