@echo off
title 元智授權軟體認證
:warning
cls
COLOR 47
echo.
echo.
echo.
echo.
echo.
echo                                     注意!
echo  ------------------------------------------------------------------------------
echo    若您在校外(使用校外IP，即非140.138.*.*)
echo.
echo    請記得先使用portal帳號登入 mskms.yzu.edu.tw 才可啟用
echo.
echo    支援 Office 2010/ 2013/ 2016
echo.
echo         Windows 7/ 8/ 8.1/ 10
echo  ------------------------------------------------------------------------------
echo \\取得IP位置中....
echo.
nslookup myip.opendns.com resolver1.opendns.com
echo           ↑↑你的ip↑↑
echo.
echo ～～～請按任意鍵繼續～～～
pause >nul

:mskms_asking
cls
COLOR 07
echo 元智微軟授權軟體設定
echo ============================================
echo.
echo Microsoft Office 按1
echo Windows 按2
echo 回主選單 按3
echo 離開 按q
echo.
echo ============================================

set /p input=請輸入:
if "%input%"=="1" goto YZU_Microsoft_Office_Activation
if "%input%"=="2" goto YZU_Windows_Activation
if "%input%"=="3" goto main
if "%input%"=="q" goto bye
goto :mskms_asking

:YZU_Microsoft_Office_Activation
cls	
echo Windows Office驗證中
cscript "ospp.vbs" /sethst:mskms.yzu.edu.tw //b
cscript "ospp.vbs" /setprt:1688 //b
cscript "ospp.vbs" /act 
echo ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
echo ※※※出現啟動成功訊息：[Product activation successful]就代表成功※※※
goto bye


:YZU_Windows_Activation
cls
slmgr -skms mskms.yzu.edu.tw
slmgr -ato
goto bye

:main
Main.bat

:bye
color 17
echo.
echo Bye! 15秒後自動關閉視窗，或按任意鍵退出
timeout /t 15 >nul
exit