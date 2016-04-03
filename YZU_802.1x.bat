@echo off
title 802.1x校園無線網路設定
:802.1x_asking
cls
color 07
echo 802.1x校園無線網路設定
echo ============================================
echo.
echo 64位元系統 按a
echo 32位元系統 按b
echo 回網路設定主選單 按c
echo 離開 按q
echo.
echo ============================================

set /p input=請輸入:
if "%input%"=="a" goto 802.1x_x64
if "%input%"=="b" goto 802.1x_x86
if "%input%"=="c" goto Internet_Main
if "%input%"=="q" goto bye
goto 802.1x_asking


:802.1x_x86
cls
echo 安裝 PEAP-GTC Plug-in ...
EAP-GTC-x86.msi /quiet /norestart /qn
echo 刪除 舊有連線設定檔...
netsh wlan delete profile name=YZUWLAN
netsh wlan delete profile name=YZU-dot1x
echo.
echo 新增 YZU-dot1x 連線設定檔...
ArubaWifiCfg_Vista.exe -add /SSID:YZU-dot1x /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE /ValidateServerCert:FALSE >NUL&&goto 802.1x_win10asking||goto 802.1x_bad

:802.1x_x64
cls
echo 安裝 PEAP-GTC Plug-in ...
EAP-GTC-x64.msi /quiet /norestart /qn
echo 刪除 舊有連線設定檔...
netsh wlan delete profile name=YZUWLAN
netsh wlan delete profile name=YZU-dot1x
echo.
echo 新增 YZU-dot1x 連線設定檔...
ArubaWifiCfg_Vista.exe -add /SSID:YZU-dot1x /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE /ValidateServerCert:FALSE >NUL&&goto 802.1x_win10asking||goto 802.1x_bad

:802.1x_win10asking
color 17
echo.
set /p input=是否為win10系統?[y/n]
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
echo 元智大學無線網路～YZU-dot1x 新增完成!
echo.
echo 請先重新開機
echo 注意電腦螢幕右下方的無線網路連線圖示：
echo 並且注意彈跳視窗，輸入相關帳號密碼。
echo 接受元智大學無線網路的相關憑證
timeout /t 3 >nul
goto bye

:802.1x_bad
cls
COLOR 47
echo 元智大學無線網路～YZU-dot1x 新增失敗!
echo 請確認你的作業系統位元
echo 是否重新執行?
echo.
set /p input=請輸入[y/n]?
if "%input%"=="y" goto 802.1x_asking
if "%input%"=="n" goto end
goto 802.1x_bad

:802.1x_win10bad
color 47
cls
echo win10 802.1x網路設定失敗，請確定設定過程中都選擇"是"
echo.
echo 是否重新執行?
echo.
set /p input=請輸入[y/n]?
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
echo Bye! 15秒後自動關閉視窗，或按任意鍵退出
timeout /t 15 >nul
exit