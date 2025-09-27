@echo off
REM Shim to ensure Hugo invokes the npm-installed sass via the .cmd wrapper
IF EXIST "%APPDATA%\npm\sass.cmd" (
  "%APPDATA%\npm\sass.cmd" %*
) ELSE (
  REM Fallback: try Program Files node global bin
  IF EXIST "C:\Program Files\nodejs\sass.cmd" (
    "C:\Program Files\nodejs\sass.cmd" %*
  ) ELSE (
    echo sass.exe/cmd not found in expected locations
    exit /b 1
  )
)
