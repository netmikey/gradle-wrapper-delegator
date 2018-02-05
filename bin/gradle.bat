@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  Gradlew search and delegate script for Windows
@rem  ( drop-in replacement for the gradle start script )
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set STARTDIR=%cd%
set LASTDIR=
set GRADLEW=

:init
@rem Get command-line arguments
set CMD_LINE_ARGS=%*

:findGradlew
if exist gradlew.bat (
    @rem echo %cd%: gradlew file exists
    set GRADLEW=%cd%\gradlew.bat
    goto execute
) else (
    @rem echo %cd%: gradlew file doesn't exist
)

:continueRecursion
set LASTDIR=%cd%
cd ..
if not "%LASTDIR%"=="%cd%" goto :findGradlew

:notFound
echo Cannot find gradlew in any parent directory.
exit /b 1

:execute
@rem Execute Gradle
@rem echo gradlew found: %GRADLEW%
cd %STARTDIR%
@rem echo exec "%GRADLEW%" %CMD_LINE_ARGS%

"%GRADLEW%" %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
