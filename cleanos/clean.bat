@ECHO off
color 0a
REM [2012.08.11]
REM �����Ż��Լǹ����
REM [2012.05.01]
REM ���ַ������ͷǷ���������ȡ����
REM [2012.02.01]
REM �ص��Ż��˱����ʻ������ļ��������ܡ���������ѭ�������Լ�Сϵͳ��Դռ��
REM �޸�ϸСBug�����޸�������������дʧ���µĹ���ʧЧ����
REM [2012.01.31]
REM �Ż�������˳�򡪡�����Ҫ�ص��������Դռ��С�Ĺ�������ִ��
REM [2012.01.30]
REM �Ż���Ϊ���ס�����ȫ�Զ�ɾ���򻷾������б����ʻ��µ������ļ����Զ�ɾ��ϵͳ���������Ĳ����ļ�
REM ��Լ�ͥʹ�ã�������ϵͳ�Ż����ܡ����Զ��ж��Ƿ���Ҫ�Ż���������Դռ��
::echo ��ǰ�ʻ���%username%
ECHO.
ECHO ==���������ڷ�����ʱ�����൱��Σ���ԣ�����ձ�����Դ��REM������==
REM ����������ʱ�ⲿ�ֲ�������ʹ�ã������˸Ų�����
echo ��ֹjava��̨���³���������
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v SunJavaUpdateSched /f >nul 2>nul
echo ��ֹAdobe Reader��������������
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "Adobe ARM" /f >nul 2>nul
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "Adobe Reader Speed Launcher" /f >nul 2>nul
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v Reader_sl /f >nul 2>nul
echo ��ֹ����������
reg delete HKEY_LOCAL_user\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v Fetion /f >nul 2>nul
echo ��ֹϵͳ���ó���Ա������
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v MSConfig /f >nul 2>nul
echo ��ֹ�������뷨������
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v IMJPMIG8.1 /f >nul 2>nul
echo ��ֹ΢�������֧��������
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v IMEKRMIG6.1 /f >nul 2>nul
echo ��ֹ΢��IME���뷨���������
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v IMSCMig /f >nul 2>nul
echo ��ֹͬ��������
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "Synchronization Manager" /f >nul 2>nul
echo ��ֹ΢��ƴ�����뷨2002������
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v MSPY2002 /f >nul 2>nul
echo ��ֹ΢��ƴ�����뷨���������
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v PHIME2002A /f >nul 2>nul
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v PHIME2002ASync /f >nul 2>nul
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "Microsoft Pinyin IME Migration" /f >nul 2>nul

TITLE ����.bak�����ļ�-����������
del /f /s /q %windir%\*.bak
REM ���ڷ�����ʱ����ɾ����־��-����������
TITLE ���ڷ�����ʱ����ɾ����־��-����������
del /f /s /q %systemdrive%\*.log
REM ��ʹ��rd /s /q %windir%\temp & md %windir%\temp������������������DB�����׳������⣡
del /f/s /q %windir%\temp\*.*
REM ��Ҫ��������ļ����������::ɾ������
rd /s /q "%windir%\help"
ECHO ::1.�������������ۼ�--ע���::
TITLE ::1.�������������ۼ�--ע���::
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\WorkgroupCrawler\Shares" /f >nul 2>nul 
ECHO ::2.�������л������ʷ��¼--ע���::
TITLE ::2.�������л������ʷ��¼--ע���::
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\Folder" /va /f >nul 2>nul 
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.txt" /va /f >nul 2>nul  
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.rar" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.mp3" /va /f >nul 2>nul 
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.jpg" /va /f >nul 2>nul 
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.ini" /va /f >nul 2>nul  
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.bmp" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.doc" /va /f >nul 2>nul  
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.eip" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.htm" /va /f >nul 2>nul  
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.ico" /va /f >nul 2>nul  
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.inf" /va /f >nul 2>nul  
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.gif" /va /f >nul 2>nul  
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.wav" /va /f >nul 2>nul  
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.xls" /va /f >nul 2>nul  
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.rm" /va /f >nul 2>nul  
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedMRU" /va /f >nul 2>nul  
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\*" /va /f >nul 2>nul  
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\mp3" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\rm" /va /f >nul 2>nul 
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\wav" /va /f >nul 2>nul  
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\bat" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\exe" /va /f >nul 2>nul 
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\eip" /va /f >nul 2>nul 
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\ico" /va /f >nul 2>nul 
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\htm" /va /f >nul 2>nul  
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\jpg" /va /f >nul 2>nul 
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StreamMRU" /va /f >nul 2>nul 
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{5E6AB780-7743-11CF-A12B-00AA004AE837}\Count" /va /f >nul 2>nul 
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{75048700-EF1F-11D0-9888-006097DEACF9}\Count" /va /f >nul 2>nul 
reg delete "HKCU\Software\WinRAR\ArcHistory" /va /f >nul 2>nul 
reg delete "HKCU\Software\WinRAR\DialogEditHistory\ArcName" /va /f >nul 2>nul
reg delete "HKCU\Software\WinRAR\DialogEditHistory\ExtrPath" /va /f >nul 2>nul 
reg delete "HKCU\Software\Microsoft\MediaPlayer\Player\RecentFileList" /va /f >nul 2>nul 
reg delete "HKCU\Software\Microsoft\Microsoft Management Console\Recent File List" /va /f >nul 2>nul 
reg delete "HKCU\Software\Microsoft\Office\11.0\PowerPoint\Recent File List" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Office\11.0\Excel\Recent File" /va /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Office\11.0\Word\Data" /v "Settings" /f >nul 2>nul
reg delete "HKCU\Software\VMware, Inc." /va /f >nul 2>nul
ECHO ::3.����IE�����ʷ�������б�--ע���::
TITLE ::3.����IE�����ʷ�������б�--ע���::
reg delete "HKCU\Software\Microsoft\Internet Explorer\TypedUrls" /va /f >nul 2>nul
ECHO ::4.����������ϵͳ�����ļ������˳�360�ȳ���::
TITLE ::4.����������ϵͳ�����ļ������˳�360�ȳ���::
del /f /q "%ALLUSERSPROFILE%\Documents\DrWatson\*.*">nul 2>nul 
del /f /s /q %systemdrive%\*.tmp
del /f /s /q %systemdrive%\*._mp
del /f /s /q %systemdrive%\*.gid
del /f /s /q %systemdrive%\*.chk
del /f /s /q %systemdrive%\*.old
del /f /s /q %systemdrive%\thumbs.db
del /f /s /q %systemdrive%\recycled\*.*
del /f /s /q %windir%\system32\dllcache\*.*
del /f /s /q %windir%\prefetch\*.*
cls
ECHO ::5.Ϊ��ȫ����������������ֻ�Ե�ǰ��¼�ʻ���Ч::
TITLE ::5.Ϊ��ȫ����������������ֻ�Ե�ǰ��¼�ʻ���Ч::
del /f /s /q "%tmp%\*.*"
ECHO ::6.�����ļ�����::
TITLE ::6.�����ļ�����::
SFC /purgecache
cls
ECHO ::7.����ϵͳ��������Ŀ¼::
TITLE ::7.����ϵͳ��������Ŀ¼::
dir %SystemRoot%\$*$ /ad/b >%SystemRoot%\DirTmp.txt 
for /f %%a in (%SystemRoot%\DirTmp.txt) do rd /s /q "%SystemRoot%\%%a" 
del /f /q %SystemRoot%\DirTmp.txt
cls
ECHO ::8.������̴������ļ�::
TITLE ::8.������̴������ļ�::
dir %SystemDrive%\found.??? /ad/b >%systemDrive%\DirTmp.txt 
for /f %%a in (%systemDrive%\DirTmp.txt) do rd /s /q "%systemDrive%\%%a" 
del /f /q %systemDrive%\DirTmp.txt
cls
ECHO ::9.������������(��)�ʻ��µ�������ʱ�ļ������Ժ�::
TITLE ::9.������������(��)�ʻ��µ�������ʱ�ļ������Ժ�::
dir "%SystemDrive%\Documents and Settings\" /ad/b >%SystemDrive%\DirTmp.txt 
for /f %%a in (%SystemDrive%\DirTmp.txt) do del /f /s /q "%SystemDrive%\Documents and Settings\%%a\Cookies\*.*"&del /f /s /q "%SystemDrive%\Documents and
Settings\%%a\Recent\*.*"&rd /s /q "%SystemDrive%\Documents and Settings\%%a\Local Settings\History\"&del /f /s /q "%SystemDrive%\Documents and Settings\%%
a\Local Settings\Temp\*.*"&del /f /s /q "%SystemDrive%\Documents and Settings\%%a\Local Settings\Temporary Internet Files\*.*"
del /f /q %SystemDrive%\DirTmp.txt
cls
ECHO ::10.ɾ��ϵͳ���������ļ����ͷſռ�::
TITLE ::10.ɾ��ϵͳ���������ļ����ͷſռ�::
rd /s /q %SystemDrive%\swsetup\
ECHO ::11.���ڽ���ϵͳ�Ż�::
TITLE ::11.���ڽ���ϵͳ�Ż�::
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v TkBellExe /f
cls
ECHO ::12.���ڽ������һ����������������ɺ��Զ��˳�::
ECHO   ����ʱԽ��ʱ��˵����ϵͳ����Խ�࣬�����ĵȴ�����ִ����ϡ�����
TITLE ::12.���ڽ������һ����������������ɺ��Զ��˳�::
cleanmgr /sagerun:99
exit