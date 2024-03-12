@echo off

call "%USERPROFILE%\miniconda3\Scripts\activate.bat" "%USERPROFILE%\miniconda3"
call conda activate NeoSR

set /p FILEPATH="Enter the file path: "
start python train.py --auto_resume -opt "%FILEPATH%"
