@echo off

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
