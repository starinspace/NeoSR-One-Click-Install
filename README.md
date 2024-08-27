# **NeoSR One-Click Install**

A one-click solution for installing [NeoSR](https://github.com/muslll/neosr).  
No files are hosted here; all necessary files are pulled directly from the original repository by **muslll**.

***
 
### **Installation Overview**

This batch file automates the following tasks:

1. **Miniconda Installation:** Installs Miniconda in silent mode and creates a Conda environment named `NeoSR`.
2. **PyTorch Installation:** Installs PyTorch with NVIDIA GPU support.
3. **NeoSR Installation:** Clones the NeoSR repository from GitHub and packages it for immediate use.

***

### **Easy Installation Steps**

1. Download the **install-neosr.bat** file and `place it in the folder where you want NeoSR to be installed`. Ensure that the folder remains in place after installation.

2. Double-click **install-neosr.bat** to begin the installation. This script will silently install Miniconda and all required dependencies. You can customize settings within the batch file to suit your preferences.

![Installation Process](https://i.ibb.co/PFpqhNt/01.png)

***

### **Running or Update NeoSR**

1. Move the **`neosr-manager.bat`** file to the NeoSR installation directory and execute it to launch NeoSR via the command line. You can then **paste** the file path or **drag-and-drop** the desired file into the command prompt to specify your [training TOML file](https://github.com/muslll/neosr/tree/master/options). The script also handles updates for batch files and installation components; remember to run *Update NeoSR* afterward to complete the update.

<img src="https://i.ibb.co/k4vqXzf/image.png" width="400" /><img src="https://i.ibb.co/DQfRjB0/image.png" width="400" />

***

### **Uninstall**

1. If you want to uninstall/remove/delete the enviroment you can use this command in cmd (will soon be added in bat-file)

```cmd
"%USERPROFILE%\miniconda3\Scripts\activate.bat" "%USERPROFILE%\miniconda3"
conda remove --name NeoSR --all
```

***
