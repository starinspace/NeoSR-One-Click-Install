:start
@echo off
:: Turn off command echoing to keep the output clean

:: Display the menu
cls
echo ===================================================
echo                     Main Menu
echo ===================================================
echo 1. Launch NeoSR
echo 2. Download Update Scripts
echo 3. Update NeoSR
echo 4. Exit
echo ===================================================

:: Prompt the user to choose an option
set /p option="Choose an option (1-4): "

:: Execute the corresponding script based on user choice
if "%option%"=="1" goto launch_neosr
if "%option%"=="2" goto download_scripts
if "%option%"=="3" goto update_neosr
if "%option%"=="4" exit

:: Handle invalid input
echo Invalid option. Please choose a number between 1 and 4.
pause
goto end

:download_scripts
@echo off
cls
:: Download the update scripts
curl -O "https://raw.githubusercontent.com/starinspace/NeoSR-One-Click-Install/main/neosr-manager.bat"
echo Scripts downloaded successfully.
pause
goto start

:update_neosr
@echo off
cls
:: Update NeoSR
call "%USERPROFILE%\miniconda3\Scripts\activate.bat" "NeoSR" && (
    conda install python=3.12 --yes && (
        conda install pytorch torchvision pytorch-cuda=11.8 -c pytorch -c nvidia --yes && (
            git pull origin master && (
                pip install -e . && (
                    pip install packaging
                )
            )
        )
    )
)
echo NeoSR updated successfully.
pause
goto start

:launch_neosr
@echo off
cls
:: Launch NeoSR
call "%USERPROFILE%\miniconda3\Scripts\activate.bat" "NeoSR"
color 07
echo.
echo ===================================================
echo                  Welcome to NeoSR Trainer
echo ===================================================
echo.
echo Please enter the file path for the training configuration,
echo or drag and drop the file here.
echo.
set /p FILEPATH="> "
if not exist "%FILEPATH%" (
    color 0C
    echo.
    echo ERROR: The specified file was not found.
    echo Please check the path and try again.
    echo.
    timeout /t 5
    exit /b
)
echo.
echo Starting training with the following configuration file:
echo %FILEPATH%
echo.
start python train.py --auto_resume -opt "%FILEPATH%"
pause
goto end

:end
:: End of the script
exit /b
