@echo off
title �����]�w�D���
:Internet_asking
cls
echo �����]�w�D���
echo ============================================
echo.
echo �]�wProxy ��1
echo �]�w802.1x�ն�L�u�����s�u ��2
echo �^�D��� ��3
echo ���} ��q
echo.
echo ============================================

set /p input=�п�J:
if "%input%"=="1" goto proxy
if "%input%"=="2" goto 802.1x
if "%input%"=="3" goto main
if "%input%"=="q" goto bye
goto Internet_asking


:proxy
YZU_ProxySetting.bat

:802.1x
YZU_802.1x.bat

:main
Main.bat


:bye
echo.
echo.
echo.
color 17
echo Bye! 15���۰����������A�Ϋ����N��h�X
timeout /t 15 >nul
exit