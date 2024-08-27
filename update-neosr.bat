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

:: Activate the Miniconda environment
call "%USERPROFILE%\miniconda3\Scripts\activate.bat" "%USERPROFILE%\miniconda3"

:: Activate the specific Conda environment named NeoSR
call conda activate NeoSR

:: Pull the latest changes from the master branch of the Git repository
git pull origin master

:: Install or update Python to version 3.12 in the Conda environment
conda install python=3.12

:: Install PyTorch, torchvision, and CUDA 11.8 for GPU acceleration from the specified channels
conda install pytorch torchvision pytorch-cuda=11.8 -c pytorch -c nvidia

:: Install the Python package located in the current directory in editable mode
pip install -e .

:: Install the packaging library for versioning and packaging tasks
pip install packaging

:: Pause the script to allow the user to review the output before closing
pause
