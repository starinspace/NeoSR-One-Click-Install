curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe -o miniconda.exe
timeout /t 1
start /wait "" miniconda.exe /S /InstallationType=JustMe
timeout /t 1
del miniconda.exe

timeout /t 1

"%USERPROFILE%\miniconda3\Scripts\activate.bat" "%USERPROFILE%\miniconda3"

rem Create and activate the Conda environment, then install packages
conda create --name NeoSR python=3.12 --yes && (
    conda activate NeoSR && (
        conda install pytorch torchvision pytorch-cuda=11.8 -c pytorch -c nvidia --yes && (
        
            rem Clone the Git repository and install the package
            git clone https://github.com/muslll/neosr && (
                cd neosr && (
                    pip install -e . && (
                        pip install packaging
                    )
                )
            )
        )
    )
)

rem Pause the script to allow the user to review the output before closing
pause
