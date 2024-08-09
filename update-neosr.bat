@echo off

call "%USERPROFILE%\miniconda3\Scripts\activate.bat" "%USERPROFILE%\miniconda3"
call conda activate NeoSR

git pull origin master

conda install python=3.12
conda install pytorch torchvision pytorch-cuda=11.8 -c pytorch -c nvidia

pip install -e .
pip install packaging
pause