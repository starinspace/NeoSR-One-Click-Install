@echo off

:: Activate conda environment
call "%USERPROFILE%\miniconda3\Scripts\activate.bat" "%USERPROFILE%\miniconda3"
call conda activate NeoSR

:: Set colors (background (first digit) and background (last digit)
:: Colors: 0 = Black, 1 = Blue, 2 = Green, 3 = Aqua, 4 = Red, 5 = Purple, 6 = Yellow, 7 = White, 8 = Gray, 9 = Light Blue, A = Light Green, B = Light Aqua, C = Light Red, D = Light Purple, E = Light Yellow, F = Bright White
color 07

:: Display a welcome message
echo.
echo ===================================================
echo                  Welcome to NeoSR Trainer
echo ===================================================
echo.

:: Prompt the user for the file path
echo Please enter the file path for the training configuration,
echo or drag and drop the file here.

echo.
set /p FILEPATH="> "

:: Check if the file exists
if not exist "%FILEPATH%" (
    color 0C
    echo.
    echo ERROR: The specified file was not found.
    echo Please check the path and try again.
    echo.
    pause
    exit /b
)

:: Start the training script with the provided file path
echo.
echo Starting training with the following configuration file:
echo %FILEPATH%
echo.

start python train.py --auto_resume -opt "%FILEPATH%"
