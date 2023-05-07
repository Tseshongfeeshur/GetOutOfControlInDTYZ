::!!!务必保存为ANSI编码!!!
@echo off
title 摆脱大同一中信息技术课的控制
rd /Q %windir%\system32\Test >nul
md %windir%\system32\Test >nul || goto needadmin
rd /Q %windir%\system32\Test >nul
:menu
cls
color f0
echo 【1】摆脱控制
echo 【2】进入控制
echo 开始摆脱时，请自行观察系统中控制软件的控制倾向。若控制已停止，请直接关闭窗口。
set c=
set /p c=输入您的选项来操作：
if /i %c%==1 goto out
if /i %c%==2 goto in

:out
color f7
:outloop
taskkill /f /im Student.* >nul
taskkill /f /im UpdateSvcClt.* >nul
taskkill /f /im logsvcclt.* >nul
taskkill /f /im MarsCltSvc.* >nul
::del /F /Q "C:\Program Files\AsiaStar" >nul
::rd /S /Q "C:\Program Files\AsiaStar" >nul
ren "C:\Program Files\AsiaStar" "C:\Program Files\AsiaStarBAK" >nul
taskkill /f /im LenRCClient.* >nul
taskkill /f /im samproprocess.* >nul
::del /F /Q "C:\Program Files\Lenovo" >nul
::rd /S /Q "C:\Program Files\Lenovo" >nul
ren "C:\Program Files\Lenovo" "C:\Program Files\LenovoBAK" >nul
attrib +h "C:\Users\Administrator\Desktop\学生机程序.lnk"
goto outloop

:in
color f7
cls
ren "C:\Program Files\AsiaStarBAK" "C:\Program Files\AsiaStar" >nul
ren "C:\Program Files\LenovoBAK" "C:\Program Files\Lenovo" >nul
attrib -h "C:\Users\Administrator\Desktop\学生机程序.lnk"
call "C:\Program Files\AsiaStar\Mars8.1\Student.exe"
call "C:\Program Files\Lenovo\EDU\Client\LenRCClient.exe"
exit

:needadmin
cls
color 40
echo 请右键单击，以管理员身份运行！
pause >nul
exit
