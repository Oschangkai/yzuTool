@echo off
title Proxy設定主選單
:proxy_asking
cls
color 07
echo Proxy設定
echo ============================================
echo.
echo 開啟Proxy 按1
echo 關閉Proxy 按2
echo 檢查當前proxy設定 按3
echo 回主選單 按4
echo 離開 按q
echo.
echo ============================================

set /p input=請輸入:
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
echo Proxy設定完成，按任意鍵繼續
pause >nul
goto proxy_checking


:pac_proxy_on_bad
color 47
cls
echo Proxy設定失敗，請確定設定過程中都選擇"是"
echo.
echo 是否重新執行?
echo.
set /p input=請輸入[y/n]?
if "%input%"=="y" goto pac_proxy_on
if "%input%"=="n" goto bye
goto pac_proxy_on_bad

:pac_proxy_off_bad
color 47
cls
echo Proxy設定失敗，請確定設定過程中都選擇"是"
echo.
echo 是否重新執行?
echo.
set /p input=請輸入[y/n]?
if "%input%"=="y" goto pac_proxy_off
if "%input%"=="n" goto bye
goto pac_proxy_off_bad

:proxy_checking
echo.
echo 請關閉任何瀏覽器，關閉後按任意鍵繼續
echo 注意! 此方式只適用於IE/Chrome，Firefox尚未測試
pause >nul
echo.
echo 進入檢查網站中....
echo 請注意proxy ip位置
echo 若proxy ip位置有ip則設定成功，關閉IE後進入下一階段
"C:\Program Files\Internet Explorer\iexplore.exe" http://210.240.175.62/NTIIS/IP_test.asp
goto bye

:http_proxy_on
netsh winhttp set proxy http://proxy.hinet.net:80
echo 設定完成
pause >nul&&goto bye

:http_proxy_off
netsh winhttp reset proxy
echo 設定完成
pause >nul&&goto bye

:main
Main.bat

:bye
color 17
echo.
echo.
echo.
echo Bye! 15秒後自動關閉視窗，或按任意鍵退出
timeout /t 15 >nul
exit