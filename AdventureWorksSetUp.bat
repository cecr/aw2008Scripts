@ECHO off
:: version 2.1
MD "C:\aw2008"

SET DATA_PATH="C:\Users\cecropia\Desktop\AdventureWorks2008\aw2008\AdventureWorks2008_Data.mdf"
SET LOG_PATH="C:\Users\cecropia\Desktop\AdventureWorks2008\aw2008\AdventureWorks2008_Log.ldf"

ECHO Copying AdventureWorks2008 files
COPY %DATA_PATH% C:\aw2008\AdventureWorks2008_Data.mdf
COPY %LOG_PATH% C:\aw2008\AdventureWorks2008_Log.ldf
IF %ERRORLEVEL% NEQ 0 (ECHO Error copying AdventureWorks2008 files)
PAUSE

::Gets Local IP Adress
FOR /f "delims=[] tokens=2" %%a in ('PING -4 -n 1 %ComputerName% ^| FINDSTR [') do SET LOCAL_IP=%%a

ECHO Creating AdventureWorks2008 database
START /WAIT sqlcmd -S %LOCAL_IP% -E -i "C:\Users\cecropia\Desktop\AdventureWorks2008\scripts\createAdventureWorks.SQL"
IF %ERRORLEVEL% NEQ 0 (ECHO Error creating AdventureWorks2008 database) ELSE (ECHO AdventureWorks2008 database created correctly)
PAUSE

ECHO Creating RandomData Table
START /WAIT sqlcmd -S %LOCAL_IP% -E -i "C:\Users\cecropia\Desktop\AdventureWorks2008\scripts\createTableRandomData.SQL"
IF %ERRORLEVEL% NEQ 0 (ECHO Error creating RandomData) ELSE (ECHO RandomData table created correctly)

ECHO Creating RandomDato Table
START /WAIT sqlcmd -S %LOCAL_IP% -E -i "C:\Users\cecropia\Desktop\AdventureWorks2008\scripts\createTableRandomDato.SQL"
IF %ERRORLEVEL% NEQ 0 (ECHO Error creating RandomDato) ELSE (ECHO RandomDato table created correctly)
PAUSE

ECHO Populating RandomData Table
START /WAIT sqlcmd -S %LOCAL_IP% -E -i "C:\Users\cecropia\Desktop\AdventureWorks2008\scripts\populateRandomData1.SQL"
IF %ERRORLEVEL% NEQ 0 (ECHO Error populating RandomData) ELSE (ECHO RandomData table populated correctly)

ECHO Populating RandomDato Table
START /WAIT sqlcmd -S %LOCAL_IP% -E -i "C:\Users\cecropia\Desktop\AdventureWorks2008\scripts\populateRandomDato.SQL"
IF %ERRORLEVEL% NEQ 0 (ECHO Error populating RandomDato) ELSE (ECHO RandomDato table populated correctly)
PAUSE