@echo off
title �������v�n��{��
:warning
cls
COLOR 47
echo.
echo.
echo.
echo.
echo.
echo                                     �`�N!
echo  ------------------------------------------------------------------------------
echo    �Y�z�b�ե~(�ϥήե~IP�A�Y�D140.138.*.*)
echo.
echo    �аO�o���ϥ�portal�b���n�J mskms.yzu.edu.tw �~�i�ҥ�
echo.
echo    �䴩 Office 2010/ 2013/ 2016
echo.
echo         Windows 7/ 8/ 8.1/ 10
echo  ------------------------------------------------------------------------------
echo \\���oIP��m��....
echo.
nslookup myip.opendns.com resolver1.opendns.com
echo           �����A��ip����
echo.
echo ����Ы����N���~�����
pause >nul

:mskms_asking
cls
COLOR 07
echo �����L�n���v�n��]�w
echo ============================================
echo.
echo Microsoft Office ��1
echo Windows ��2
echo �^�D��� ��3
echo ���} ��q
echo.
echo ============================================

set /p input=�п�J:
if "%input%"=="1" goto YZU_Microsoft_Office_Activation
if "%input%"=="2" goto YZU_Windows_Activation
if "%input%"=="3" goto main
if "%input%"=="q" goto bye
goto :mskms_asking

:YZU_Microsoft_Office_Activation
cls	
echo Windows Office���Ҥ�
cscript "ospp.vbs" /sethst:mskms.yzu.edu.tw //b
cscript "ospp.vbs" /setprt:1688 //b
cscript "ospp.vbs" /act 
echo ����������������������������������������
echo �������X�{�Ұʦ��\�T���G[Product activation successful]�N�N���\������
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
echo Bye! 15���۰����������A�Ϋ����N��h�X
timeout /t 15 >nul
exit