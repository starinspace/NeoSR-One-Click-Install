curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe -o miniconda.exe
timeout /t 1
start /wait "" miniconda.exe /S /InstallationType=JustMe
timeout /t 1
del miniconda.exe

timeout /t 1

%USERPROFILE%\miniconda3\Scripts\activate.bat %USERPROFILE%\miniconda3

conda create --name NeoSR python=3.11
conda activate NeoSR
conda install pytorch=2.1.2 torchvision pytorch-cuda=11.8 -c pytorch -c nvidia
git clone https://github.com/muslll/neosr
cd neosr
pip install -e .
pip install packaging