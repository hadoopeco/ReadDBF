@echo off
rem ��ȡwindows�汾
set move_dir=%SystemRoot%\winsxs_del
if not exist %move_dir%\nul md %move_dir%
set winver=none
FOR /F "eol=; tokens=4* delims=] " %%i in ('ver') do set winver=%%i
if "%winver%" == "none" goto enover
echo windows version is %winver%, ready to list winsxs dir.
if not exist %SystemRoot%\winsxs\nul goto enosxs

set ver_prefix=%winver:~0,-1%
echo list winsxs finished! now ready to clear duplicated files 
echo dir /ad %SystemRoot%\winsxs\*_%ver_prefix%*

if "%1" == "run-winsxs-generated" goto :lSkipGen
rem ׼�����ɴ���
copy /y "%~f0" "%temp%\%~nx0" > nul
echo rem genereted code here >> "%temp%\%~nx0"
echo :ldcdStat1 >> "%temp%\%~nx0"
echo set end4=%%arg:%ver_prefix%=%%>> "%temp%\%~nx0"
echo goto ldcdStat2 >> "%temp%\%~nx0"
echo :ldcdStat3 >> "%temp%\%~nx0"
echo set end4a=%%arg:%winver%=%%>> "%temp%\%~nx0"
echo goto ldcdStat4 >> "%temp%\%~nx0"
rem notepad "%temp%\%~nx0"
"%temp%\%~nx0" run-winsxs-generated
goto :EOF

:lSkipGen
FOR /F "eol=; tokens=1-4 delims= " %%a in ('dir /ad %SystemRoot%\winsxs\*_%ver_prefix%*') do (
    if "%%c" == "<DIR>" call:fnDoClear %%d
)

echo clear OK!
goto :EOF

:enover
echo could not get windows version, abort!
goto :EOF

:enosxs
echo not found %SystemRoot%\winsxs! maybe no privilege or lower windows!
echo only support windows XP and later!
goto :EOF

:fnDoClear
rem arg: dir_name
FOR /F "eol=; tokens=1-14 delims=_" %%g in ("%1") do call:fnDoClearDir %1 %%g %%h %%i %%j %%k %%l %%m %%n %%o %%p %%q %%r %%s %%t %%u %%v %%w %%x %%y %%z
goto :EOF

:fnDoClearDir 
rem arg: dir_name dir_parts 
set d_name=%1
rem �������Ƿ�ƥ�� %winver%, ������ǰ����.ͬʱ׼������°汾ƥ������,nv1�浱ǰ�汾��nv2�浱ǰ��ǰһ���汾
set nv1=%2_%3_
set nv2=%2_%3_
:ldcdCycle
if "%4" == "" goto :EOF
rem ����Ƿ� ver_prefix ��ͷ,��������������Ƿ�winver���������winver���ʾĿ�����
set arg=%4
rem set line=set end4=%%arg:%ver_prefix%=%%
rem %line%
goto ldcdStat1
:ldcdStat2
if "%arg%" == "%end4%" goto ldcdNext
rem ����Ƿ� winver ��ͷ
rem set line=set end4a=%%arg:%winver%=%%
rem %line%
goto ldcdStat3
:ldcdStat4
if not "%arg%" == "%end4a%" goto :EOF
rem ������Ϊ ver_prefix ��ͷ �� ������ winver ��Ŀ¼��,������°汾�Ƿ���ڣ��������ɾ���ɵ�
set newfound=false
for /d %%v in ("%SystemRoot%\winsxs\%nv1%%winver%.*_%5_*") do (
    if exist %%v\nul set newfound=true
)    
if "%newfound%" == "true" call:fnDelDir %d_name%

goto :EOF
:ldcdNext
set nv2=%nv1%
set nv1=%nv2%%4_
shift
goto ldcdCycle

:fnDelDir
rem arg: dir
echo del %SystemRoot%\winsxs\%1
takeown /r /f "%SystemRoot%\winsxs\%1"
cacls "%SystemRoot%\winsxs\%1" /t /e /g everyone:f
move "%SystemRoot%\winsxs\%1" "%move_dir%\%1"
goto :EOF