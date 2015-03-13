@ECHO off
color 0a
REM [2012.08.11]
REM 增加优化自记功项功能
REM [2012.05.01]
REM 区分服务器和非服务器（已取消）
REM [2012.02.01]
REM 重点优化了本地帐户垃圾文件索引功能——减少了循环次数以减小系统资源占用
REM 修复细小Bug——修复个别因命令书写失误导致的功能失效问题
REM [2012.01.31]
REM 优化了清理顺序——将需要重点清除和资源占用小的功能优先执行
REM [2012.01.30]
REM 优化更为彻底——可全自动删除域环境下所有本地帐户下的垃圾文件、自动删除系统更新遗留的补丁文件
REM 针对家庭使用，增加了系统优化功能——自动判断是否需要优化，减少资源占用
::echo 当前帐户：%username%
ECHO.
ECHO ==本程序用于服务器时具有相当的危险性，请参照本程序源码REM操作！==
REM 服务器操作时这部分操作请勿使用！否则本人概不负责！
echo 禁止java后台更新程序自启动
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v SunJavaUpdateSched /f >nul 2>nul
echo 禁止Adobe Reader升级程序自启动
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "Adobe ARM" /f >nul 2>nul
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "Adobe Reader Speed Launcher" /f >nul 2>nul
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v Reader_sl /f >nul 2>nul
echo 禁止飞信自启动
reg delete HKEY_LOCAL_user\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v Fetion /f >nul 2>nul
echo 禁止系统配置程序员自启动
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v MSConfig /f >nul 2>nul
echo 禁止日语输入法自启动
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v IMJPMIG8.1 /f >nul 2>nul
echo 禁止微软多语言支持自启动
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v IMEKRMIG6.1 /f >nul 2>nul
echo 禁止微软IME输入法组件自启动
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v IMSCMig /f >nul 2>nul
echo 禁止同步自启动
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "Synchronization Manager" /f >nul 2>nul
echo 禁止微软拼音输入法2002自启动
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v MSPY2002 /f >nul 2>nul
echo 禁止微软拼音输入法组件自启动
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v PHIME2002A /f >nul 2>nul
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v PHIME2002ASync /f >nul 2>nul
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "Microsoft Pinyin IME Migration" /f >nul 2>nul

TITLE 清理.bak备份文件-谨慎操作！
del /f /s /q %windir%\*.bak
REM 用于服务器时请勿删除日志！-谨慎操作！
TITLE 用于服务器时请勿删除日志！-谨慎操作！
del /f /s /q %systemdrive%\*.log
REM 勿使用rd /s /q %windir%\temp & md %windir%\temp命令，否则服务器服务（如DB）容易出现问题！
del /f/s /q %windir%\temp\*.*
REM 若要清理帮助文件，将下面的::删除即可
rd /s /q "%windir%\help"
ECHO ::1.清理局域网共享痕迹--注册表::
TITLE ::1.清理局域网共享痕迹--注册表::
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\WorkgroupCrawler\Shares" /f >nul 2>nul 
ECHO ::2.清理运行或操作历史记录--注册表::
TITLE ::2.清理运行或操作历史记录--注册表::
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
ECHO ::3.清理IE浏览历史的下拉列表--注册表::
TITLE ::3.清理IE浏览历史的下拉列表--注册表::
reg delete "HKCU\Software\Microsoft\Internet Explorer\TypedUrls" /va /f >nul 2>nul
ECHO ::4.正在清理常见系统垃圾文件，请退出360等程序::
TITLE ::4.正在清理常见系统垃圾文件，请退出360等程序::
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
ECHO ::5.为安全起见，以下清理操作只对当前登录帐户有效::
TITLE ::5.为安全起见，以下清理操作只对当前登录帐户有效::
del /f /s /q "%tmp%\*.*"
ECHO ::6.清理文件缓存::
TITLE ::6.清理文件缓存::
SFC /purgecache
cls
ECHO ::7.清理系统升级补丁目录::
TITLE ::7.清理系统升级补丁目录::
dir %SystemRoot%\$*$ /ad/b >%SystemRoot%\DirTmp.txt 
for /f %%a in (%SystemRoot%\DirTmp.txt) do rd /s /q "%SystemRoot%\%%a" 
del /f /q %SystemRoot%\DirTmp.txt
cls
ECHO ::8.清理磁盘错误检测文件::
TITLE ::8.清理磁盘错误检测文件::
dir %SystemDrive%\found.??? /ad/b >%systemDrive%\DirTmp.txt 
for /f %%a in (%systemDrive%\DirTmp.txt) do rd /s /q "%systemDrive%\%%a" 
del /f /q %systemDrive%\DirTmp.txt
cls
ECHO ::9.正在清理所有(域)帐户下的所有临时文件，请稍候::
TITLE ::9.正在清理所有(域)帐户下的所有临时文件，请稍候::
dir "%SystemDrive%\Documents and Settings\" /ad/b >%SystemDrive%\DirTmp.txt 
for /f %%a in (%SystemDrive%\DirTmp.txt) do del /f /s /q "%SystemDrive%\Documents and Settings\%%a\Cookies\*.*"&del /f /s /q "%SystemDrive%\Documents and
Settings\%%a\Recent\*.*"&rd /s /q "%SystemDrive%\Documents and Settings\%%a\Local Settings\History\"&del /f /s /q "%SystemDrive%\Documents and Settings\%%
a\Local Settings\Temp\*.*"&del /f /s /q "%SystemDrive%\Documents and Settings\%%a\Local Settings\Temporary Internet Files\*.*"
del /f /q %SystemDrive%\DirTmp.txt
cls
ECHO ::10.删除系统驱动备份文件，释放空间::
TITLE ::10.删除系统驱动备份文件，释放空间::
rd /s /q %SystemDrive%\swsetup\
ECHO ::11.正在进行系统优化::
TITLE ::11.正在进行系统优化::
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v TkBellExe /f
cls
ECHO ::12.正在进行最后一步——磁盘清理，完成后自动退出::
ECHO   当耗时越长时，说明你系统垃圾越多，请耐心等待程序执行完毕。。。
TITLE ::12.正在进行最后一步——磁盘清理，完成后自动退出::
cleanmgr /sagerun:99
exit