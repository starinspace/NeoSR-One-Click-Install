@echo off

:: Download and update NeoSR-One-Click-Install using curl
curl -O "https://raw.githubusercontent.com/starinspace/NeoSR-One-Click-Install/main/run-neosr.bat"

:: Download version.txt from GitHub to retrieve the required Python version and dependencies
curl -O "https://raw.githubusercontent.com/starinspace/NeoSR-One-Click-Install/main/version/version.txt"

:: Read Python version and packages from version.txt
for /f "tokens=1,2 delims==" %%a in (version.txt) do (
    if "%%a"=="python" set "PYTHON_VERSION=%%b"
    if "%%a"=="packages" set "PACKAGES=%%b"
)

:: Activate the Conda environment
call "%USERPROFILE%\miniconda3\Scripts\activate.bat" "%USERPROFILE%\miniconda3"
call conda activate NeoSR

:: Pull the latest changes from the Git repository
git pull origin master

:: Install the required Python version
conda install python=%PYTHON_VERSION%

:: Install the required packages
for %%p in (%PACKAGES%) do (
    conda install %%p
)

:: Install Python packages
pip install -e .
pip install packaging

pause
