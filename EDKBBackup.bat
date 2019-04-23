@echo off
:: variables Drive= Place to backup files
set drive=E:\EDKBBackup
set backupcmd=xcopy /s /c /d /e /h /i /r /y

echo ### Backing Up ED Key Binds

%backupcmd% "C:\Users\%username%\AppData\Local\Frontier Developments\Elite Dangerous\Options\Bindings" %drive%\KeyBinds

@pause

echo ### Backing Up ED Journal
%backupcmd% "C:\Users\%username%\Saved Games\Frontier Developments\Elite Dangerous" %drive%\Journal

@pause

echo ### Backing Up ED Graphics
%backupcmd% "C:\Users\%username%\AppData\Local\Frontier Developments\Elite Dangerous\Options\Graphics" %drive%\Graphics

:: use below syntax to backup other directories...
:: %backupcmd% "...source directory..." "%drive%\...destination dir..."

echo Backup Complete!
@pause