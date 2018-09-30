@ECHO off
REM http://steve-jansen.github.io/guides/windows-batch-scripting/
:: This is also a comment
SETLOCAL ENABLEEXTENSIONS

REM Command Line Arguments
:: The filename with extension of the # arg
SET me=%~nx0
ECHO me=%me%
:: The full path to the parent folder of the argument. 
SET parent=%~dp0
ECHO parent=%parent%
:: The full path to the folder of the argument
SET fullpath=%~f0
ECHO full path=%fullpath%
ECHO First arg=%1
ECHO First arg without quotes=%~1
ECHO First arg parent folder=%~dp1
ECHO First arg full path=%~f1
ECHO First arg full path in DOS 8.3 shortname=%~fs1

REM checking if a FILE/FOLDER exists
IF EXIST "%2" (
  ECHO File %2 exists
) 
IF NOT EXIST "%2" (
  ECHO File %2 not found
)

REM Checking if a VARIABLE is defined
IF DEFINED me echo The variable me is definead as=%me%

REM Checking if an argument is empty
IF  [%3%]==[] (
  ECHO %3 is undefined
) ELSE (
  ECHO Third argument is %3
)
IF "%~3"=="Test text" ECHO 3rd argument equals Test text

REM Redirect (create/overwrite) to a file
::DIR > testLog.txt
REM Redirect (append) stdout to a file
::DIR >> testLog.txt 
REM Redirect (append) both stdout and stderror
::DIR >> testLog.txt 2>&1
REM Discard output
::DIR > NUL
REM PIPE the output of a command to another command
::DIR /B | SORT >> testLog.txt
REM redirect the CONsole input to a file
::TYPE CON > testLog.txt

REM To run a 2nd command based on the success/fail of prev
cd %parent% && ECHO cd %parent% successfull, errorlevel=%ERRORLEVEL% > testLog.txt
cd %parent% || ECHO not failed, errorlevel=%ERRORLEVEL%
cd %3 && ECHO cd %3 successfull, errorlevel=%ERRORLEVEL%
cd %3 || GOTO :endscript

:endscript
IF %ERRORLEVEL% EQU 0 (
  ECHO Alles ist gut
)
IF %ERRORLEVEL% NEQ 0 (
	ECHO %me% exited with error %ERRORLEVEL% 
	ECHO %me% exited with error %ERRORLEVEL% >> testLog.txt
)
