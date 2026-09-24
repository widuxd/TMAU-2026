@echo off
setlocal

if not exist "%~dp0CMakeLists.txt" (
    echo ERROR: CMakeLists.txt not found
    pause
    exit /b 1
)

cd /d "%~dp0"

echo =====================================
echo STARTING BUILD PROCESS
echo =====================================
echo.

echo STAGE 1: Configuration
cmake -S . -B build
if errorlevel 1 goto error

echo.
echo STAGE 2: Compilation
cmake --build build --config Release
if errorlevel 1 goto error

echo.
echo =====================================
echo SUCCESS: Build completed successfully
echo =====================================
echo.

pause
goto end

:error
echo.
echo =====================================
echo ERROR: Build failed
echo =====================================
pause
exit /b 1

:end
endlocal