@echo off
:title
title �����]�w�p�u��
cls
color 17
echo ���������]�w �� �L�n���v�n��ҥΤp�u��
echo �ӷ�:
echo http://forum.cse.yzu.edu.tw/
echo http://www.yzu.edu.tw/
echo https://support.microsoft.com/en-us/kb/3121002
echo.
echo �Ы����N��i�J�]�w�e��
pause >nul

:main
cls
color 07
echo �D���
echo ============================================
echo.
echo �����]�w ��1
echo �����L�n���v�]�w ��2
echo ���}�� ��q
echo.
echo ============================================

set /p input=�п�J:
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
echo Bye! 15���۰����������A�Ϋ����N��h�X
timeout /t 15 >nul
exit