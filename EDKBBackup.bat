@echo off
:: variables Drive= Place to backup files
set drive=E:\EDKBBackup
set backupcmd=xcopy /s /c /d /e /h /i /r /y

SET /P Bindsyesno=Do you wish to proceed to backup your Key Binds? [y/n]:
IF "%Bindsyesno%"=="y" GOTO KeyBinds
IF "%Bindsyesno%"=="n" GOTO Journalstart

:KeyBinds
echo ### Backing Up ED Key Binds
%backupcmd% "C:\Users\%username%\AppData\Local\Frontier Developments\Elite Dangerous\Options\Bindings" %drive%\KeyBinds

:Journalstart
SET /P Journalyesno=Do you wish to proceed to backup your Journal? [y/n]:
IF "%Journalyesno%"=="y" GOTO Journal
IF "%Journalyesno%"=="n" GOTO Graphicsstart

:Journal
echo ### Backing Up ED Journal
%backupcmd% "C:\Users\%username%\Saved Games\Frontier Developments\Elite Dangerous" %drive%\Journal

:Graphicsstart
SET /P Graphicsyesno=Do you wish to proceed to backup your Graphics? [y/n]:
IF "%Graphicsyesno%"=="y" GOTO Graphics
IF "%Graphicsyesno%"=="n" GOTO End

:Graphics
echo ### Backing Up ED Graphics
%backupcmd% "C:\Users\%username%\AppData\Local\Frontier Developments\Elite Dangerous\Options\Graphics" %drive%\Graphics

:: use below syntax to backup other directories...
:: %backupcmd% "...source directory..." "%drive%\...destination dir..."

echo Backup Complete!

:End
