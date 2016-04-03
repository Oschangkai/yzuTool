@echo off
:title
title 元智設定小工具
cls
color 17
echo 元智網路設定 及 微軟授權軟體啟用小工具
echo 來源:
echo http://forum.cse.yzu.edu.tw/
echo http://www.yzu.edu.tw/
echo https://support.microsoft.com/en-us/kb/3121002
echo.
echo 請按任意鍵進入設定畫面
pause >nul

:main
cls
color 07
echo 主選單
echo ============================================
echo.
echo 網路設定 按1
echo 元智微軟授權設定 按2
echo 離開請 按q
echo.
echo ============================================

set /p input=請輸入:
if "%input%"=="1" goto Internet
if "%input%"=="2" goto mskms
if "%input%"=="q" goto bye
goto main

:Internet
YZU_Internet_Main.bat

:mskms
YZU_mskms.bat

:bye
cls
color 17
echo Bye! 15秒後自動關閉視窗，或按任意鍵退出
timeout /t 15 >nul
exit