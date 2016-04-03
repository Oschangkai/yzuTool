@echo off
title 802.1x�ն�L�u�����]�w
:802.1x_asking
cls
color 07
echo 802.1x�ն�L�u�����]�w
echo ============================================
echo.
echo 64�줸�t�� ��a
echo 32�줸�t�� ��b
echo �^�����]�w�D��� ��c
echo ���} ��q
echo.
echo ============================================

set /p input=�п�J:
if "%input%"=="a" goto 802.1x_x64
if "%input%"=="b" goto 802.1x_x86
if "%input%"=="c" goto Internet_Main
if "%input%"=="q" goto bye
goto 802.1x_asking


:802.1x_x86
cls
echo �w�� PEAP-GTC Plug-in ...
EAP-GTC-x86.msi /quiet /norestart /qn
echo �R�� �¦��s�u�]�w��...
netsh wlan delete profile name=YZUWLAN
netsh wlan delete profile name=YZU-dot1x
echo.
echo �s�W YZU-dot1x �s�u�]�w��...
ArubaWifiCfg_Vista.exe -add /SSID:YZU-dot1x /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE /ValidateServerCert:FALSE >NUL&&goto 802.1x_win10asking||goto 802.1x_bad

:802.1x_x64
cls
echo �w�� PEAP-GTC Plug-in ...
EAP-GTC-x64.msi /quiet /norestart /qn
echo �R�� �¦��s�u�]�w��...
netsh wlan delete profile name=YZUWLAN
netsh wlan delete profile name=YZU-dot1x
echo.
echo �s�W YZU-dot1x �s�u�]�w��...
ArubaWifiCfg_Vista.exe -add /SSID:YZU-dot1x /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE /ValidateServerCert:FALSE >NUL&&goto 802.1x_win10asking||goto 802.1x_bad

:802.1x_win10asking
color 17
echo.
set /p input=�O�_��win10�t��?[y/n]
if "%input%"=="y" goto 802.1x_win10config
if "%input%"=="n" goto 802.1x_success
goto 802.1x_win10asking

:802.1x_win10config
Disable_TLS_1.2.reg
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RasMan\PPP\EAP\13" /v TlsVersion
if errorlevel 1 goto 802.1x_win10bad
if errorlevel 0 goto 802.1x_success

:802.1x_success
cls
color 27
echo.
echo �����j�ǵL�u������YZU-dot1x �s�W����!
echo.
echo �Х����s�}��
echo �`�N�q���ù��k�U�誺�L�u�����s�u�ϥܡG
echo �åB�`�N�u�������A��J�����b���K�X�C
echo ���������j�ǵL�u��������������
timeout /t 3 >nul
goto bye

:802.1x_bad
cls
COLOR 47
echo �����j�ǵL�u������YZU-dot1x �s�W����!
echo �нT�{�A���@�~�t�Φ줸
echo �O�_���s����?
echo.
set /p input=�п�J[y/n]?
if "%input%"=="y" goto 802.1x_asking
if "%input%"=="n" goto end
goto 802.1x_bad

:802.1x_win10bad
color 47
cls
echo win10 802.1x�����]�w���ѡA�нT�w�]�w�L�{�������"�O"
echo.
echo �O�_���s����?
echo.
set /p input=�п�J[y/n]?
if "%input%"=="y" goto 802.1x_win10config
if "%input%"=="n" goto bye
goto 802.1x_win10bad

:Internet_Main
YZU_Internet_Main.bat

:bye
color 17
echo.
echo.
echo.
echo Bye! 15���۰����������A�Ϋ����N��h�X
timeout /t 15 >nul
exit