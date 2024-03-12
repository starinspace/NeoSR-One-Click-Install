@echo off

call "%USERPROFILE%\miniconda3\Scripts\activate.bat" "%USERPROFILE%\miniconda3"
call conda activate NeoSR

git pull origin master

pip install -e .

pause