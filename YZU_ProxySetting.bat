@echo off
title Proxy�]�w�D���
:proxy_asking
cls
color 07
echo Proxy�]�w
echo ============================================
echo.
echo �}��Proxy ��1
echo ����Proxy ��2
echo �ˬd��eproxy�]�w ��3
echo �^�D��� ��4
echo ���} ��q
echo.
echo ============================================

set /p input=�п�J:
if "%input%"=="1" goto pac_proxy_on
if "%input%"=="2" goto pac_proxy_off
if "%input%"=="3" goto proxy_checking
if "%input%"=="4" goto main
if "%input%"=="hineton" goto http_proxy_on
if "%input%"=="hinetoff" goto http_proxy_off
if "%input%"=="q" goto bye
goto proxy_asking


:pac_proxy_on
enable_PAC_Proxy.reg
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL
if errorlevel 1 goto pac_proxy_on_bad
if errorlevel 0 goto pac_proxy_success

:pac_proxy_off
disable_PAC_Proxy.reg
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL
if errorlevel 1 goto pac_proxy_success
if errorlevel 0 goto pac_proxy_off_bad

:pac_proxy_success
color 27
cls
echo Proxy�]�w�����A�����N���~��
pause >nul
goto proxy_checking


:pac_proxy_on_bad
color 47
cls
echo Proxy�]�w���ѡA�нT�w�]�w�L�{�������"�O"
echo.
echo �O�_���s����?
echo.
set /p input=�п�J[y/n]?
if "%input%"=="y" goto pac_proxy_on
if "%input%"=="n" goto bye
goto pac_proxy_on_bad

:pac_proxy_off_bad
color 47
cls
echo Proxy�]�w���ѡA�нT�w�]�w�L�{�������"�O"
echo.
echo �O�_���s����?
echo.
set /p input=�п�J[y/n]?
if "%input%"=="y" goto pac_proxy_off
if "%input%"=="n" goto bye
goto pac_proxy_off_bad

:proxy_checking
echo.
echo �����������s�����A����������N���~��
echo �`�N! ���覡�u�A�Ω�IE/Chrome�AFirefox�|������
pause >nul
echo.
echo �i�J�ˬd������....
echo �Ъ`�Nproxy ip��m
echo �Yproxy ip��m��ip�h�]�w���\�A����IE��i�J�U�@���q
"C:\Program Files\Internet Explorer\iexplore.exe" http://210.240.175.62/NTIIS/IP_test.asp
goto bye

:http_proxy_on
netsh winhttp set proxy http://proxy.hinet.net:80
echo �]�w����
pause >nul&&goto bye

:http_proxy_off
netsh winhttp reset proxy
echo �]�w����
pause >nul&&goto bye

:main
Main.bat

:bye
color 17
echo.
echo.
echo.
echo Bye! 15���۰����������A�Ϋ����N��h�X
timeout /t 15 >nul
exit