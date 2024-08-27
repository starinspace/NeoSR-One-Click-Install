@echo off
:: Turn off command echoing to keep the output clean

:: Define URLs for the batch files
set "URL_RUN=https://raw.githubusercontent.com/starinspace/NeoSR-One-Click-Install/main/run-neosr.bat"
set "URL_UPDATE=https://raw.githubusercontent.com/starinspace/NeoSR-One-Click-Install/main/update-neosr.bat"

:: Define filenames for the batch files
set "FILE_RUN=run-neosr.bat"
set "FILE_UPDATE=update-neosr.bat"

:: Define temporary filenames
set "TEMP_RUN=%TEMP%\run-neosr.bat"
set "TEMP_UPDATE=%TEMP%\update-neosr.bat"

:: Download the files to temporary locations
curl -o "%TEMP_RUN%" "%URL_RUN%"
curl -o "%TEMP_UPDATE%" "%URL_UPDATE%"

:: Compare and replace run-neosr.bat if necessary
if exist "%FILE_RUN%" (
    fc /b "%FILE_RUN%" "%TEMP_RUN%" >nul
    if errorlevel 1 (
        echo Updating %FILE_RUN%...
        move /Y "%TEMP_RUN%" "%FILE_RUN%" >nul
    )
) else (
    echo File %FILE_RUN% does not exist. Downloading...
    move /Y "%TEMP_RUN%" "%FILE_RUN%" >nul
)

:: Compare and replace update-neosr.bat if necessary
if exist "%FILE_UPDATE%" (
    fc /b "%FILE_UPDATE%" "%TEMP_UPDATE%" >nul
    if errorlevel 1 (
        echo Updating %FILE_UPDATE%...
        move /Y "%TEMP_UPDATE%" "%FILE_UPDATE%" >nul
    )
) else (
    echo File %FILE_UPDATE% does not exist. Downloading...
    move /Y "%TEMP_UPDATE%" "%FILE_UPDATE%" >nul
)

