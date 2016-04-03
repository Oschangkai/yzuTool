@echo off
title 網路設定主選單
:Internet_asking
cls
echo 網路設定主選單
echo ============================================
echo.
echo 設定Proxy 按1
echo 設定802.1x校園無線網路連線 按2
echo 回主選單 按3
echo 離開 按q
echo.
echo ============================================

set /p input=請輸入:
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
echo Bye! 15秒後自動關閉視窗，或按任意鍵退出
timeout /t 15 >nul
exit