@echo off
:: variables Drive= Place to backup files
set drive=E:\EDKBBackup
set backupcmd=xcopy /s /c /d /e /h /i /r /y
set restorecmd=xcopy /s /c /e /h /i /r /y

:Process
SET /P Process=Do you want to backup or restore? [backup (b)/restore (r)]:
IF "%Process%"=="r" GOTO restore
IF "%Process%"=="b" GOTO Backup
IF "%Process%"=="" GOTO Process

:Backup
SET /P Bindsyesno=Do you wish to proceed to backup your Key Binds? [y/n]:
IF "%Bindsyesno%"=="y" GOTO KeyBinds
IF "%Bindsyesno%"=="n" GOTO Journalstart
IF "%Bindsyesno%"=="" GOTO Backup

:KeyBinds
echo ### Backing Up ED Key Binds
%backupcmd% "C:\Users\%username%\AppData\Local\Frontier Developments\Elite Dangerous\Options\Bindings" %drive%\KeyBinds

:Journalstart
SET /P Journalyesno=Do you wish to proceed to backup your Journal? [y/n]:
IF "%Journalyesno%"=="y" GOTO Journal
IF "%Journalyesno%"=="n" GOTO Graphicsstart
IF "%Journalyesno%"=="" GOTO KeyBinds

:Journal
echo ### Backing Up ED Journal
%backupcmd% "C:\Users\%username%\Saved Games\Frontier Developments\Elite Dangerous" %drive%\Journal

:Graphicsstart
SET /P Graphicsyesno=Do you wish to proceed to backup your Graphics? [y/n]:
IF "%Graphicsyesno%"=="y" GOTO Graphics
IF "%Graphicsyesno%"=="n" GOTO End
IF "%Graphicsyesno%"=="" GOTO Graphicsstart

:Graphics
echo ### Backing Up ED Graphics
%backupcmd% "C:\Users\%username%\AppData\Local\Frontier Developments\Elite Dangerous\Options\Graphics" %drive%\Graphics

:: use below syntax to backup other directories...
:: %backupcmd% "...source directory..." "%drive%\...destination dir..."

echo Backup Complete!

GOTO End

:restore
echo ### Restoring ED Key Binds
%restorecmd% "E:\EDKBBackup\KeyBinds" "C:\Users\%username%\AppData\Local\Frontier Developments\Elite Dangerous\Options\Bindings"
%restorecmd% "E:\EDKBBackup\Graphics" "C:\Users\%username%\AppData\Local\Frontier Developments\Elite Dangerous\Options\Graphics"
%restorecmd% "E:\EDKBBackup\Journal" "C:\Users\%username%\Saved Games\Frontier Developments\Elite Dangerous"
echo ### restore done

:End
timeout 5