# 元智設定小工具-yzuTool
## 簡介

### 介紹
  校內有許多小工具，例如網路設定，校內授權軟體設定。每個工具零散在校內網路各地，需要什麼功能就要下載什麼程式。<br>
  不如把他們整合在一起吧！一個小檔案解決一切需求。這就是yzuTool誕生的原因~~

### 開發工具
- Notepad
- Bat2exe Converter


## Feature

- 網路功能
	- Proxy設定<br>
		掛載元智資工系Proxy.pac 讓宿網流量更低，上網更快速
	- YZU-dot1x網路設定<br>
		整合x86/x64系統，不用因為系統位元不同而下載不同的檔案
- 校內授權軟體驗證
	- Windows授權驗證
	- Office授權驗證

## Release Notes

### v3
[(2015/10/16)](https://github.com/Oschangkai/yzuTool/raw/master/Publish/v3/元智設定小工具.exe)

- 大更新
	- 增加頁面顏色，讓使用者更容易分辨在哪個頁面
	- 分割檔案，易於管理
	- 由"元智網路設定小工具"改名為"元智設定小工具"
	- 新增mskms功能(Microsoft授權軟體驗證:Office/Windows)
	- 使用vbs在特定頁面取得最高權限
	- 啟用壓縮，大幅減小(約80%)的檔案大小
	- 取消密碼
- 修正大部分的bug
	- 改變proxy掛載網址，以接收最新版proxy.pac
	- 開啟彩蛋進入方式

#### Update1
[(2015/12/15)](https://github.com/Oschangkai/yzuTool/raw/master/Publish/v3/元智設定小工具-Update1.exe)

- 更新EAP-GTC至最新版
- 取消以vbs取得最高權限(解決無限loop開啟視窗)
- 優化提示訊息，讓使用者更容易操作

#### Update2
[(2015/12/19)](https://github.com/Oschangkai/yzuTool/raw/master/Publish/v3/元智設定小工具-Update2.exe)

- 優化檢查proxy掛載: 強制以IE開啟檢查頁面

#### Update3<最新版>
[(2016/04/04)](https://github.com/Oschangkai/yzuTool/raw/master/Publish/v3/元智設定小工具-Update3.exe)

- 修正bug: TLS1.2造成Win10無法使用802.1x網路，新增Disable TLS1.2的提示訊息

### v1-Update4
[(2015/09/10)](https://github.com/Oschangkai/yzuTool/raw/master/Publish/v1/YZU_internet_setting_v1.exe)

- 公開發布第一版
- 功能:
	- proxy設定
	- 802.1x網路設定(Win7/Win8/Win8.1)
- 彩蛋:hinet proxy
- 密碼:yzu

### v2
[(2015-09-11)](https://github.com/Oschangkai/yzuTool/raw/master/Publish/v2/YZU_internet_setting_v2.exe)

- bug修正
	- 由匯入xml的方式新增YZU-dot1x改為使用ArubaWifiCfg_Vista.exe(權限問題)
- 密碼:yzu

## 參考資料
[元智大學資服處](http://www.yzu.edu.tw/admin/is/)  
[元智大學資工系](http://forum.cse.yzu.edu.tw/)  
[Aruba官方網站](https://support.arubanetworks.com/ToolsResources/tabid/76/DMXModule/514/EntryId/114/Default.aspx)  
[微軟官方說明網站](https://support.microsoft.com/en-us/kb/3121002)

