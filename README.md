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

1. Download the **easy-install_neosr.bat** file and `place it in the folder where you want NeoSR to be installed`. Ensure that the folder remains in place after installation.

2. Double-click **easy-install_neosr.bat** to begin the installation. This script will silently install Miniconda and all required dependencies. You can customize settings within the batch file to suit your preferences.

![Installation Process](https://i.ibb.co/PFpqhNt/01.png)

***

### **Updating NeoSR**

1. To update NeoSR to the latest version, first run **update-one-click-install.bat** to update to latest bat-files.
2. Then simply run **update-neosr.bat**. This will download the latest release and update any necessary dependencies.

***

### **Running NeoSR**

1. Move the **launch-neosr.bat** file to the NeoSR installation directory. Execute **launch-neosr.bat** to launch NeoSR via the command line. From there, you can **paste the file path** or **drag-and-drop** the desired file into the command prompt to specify your [training toml file](https://github.com/muslll/neosr/tree/master/options).

![Running NeoSR](https://i.ibb.co/4m9gPQ8/02.png)

***

### **Uninstall**

1. If you want to uninstall/remove/delete the enviroment you can use this command in cmd:

```cmd
"%USERPROFILE%\miniconda3\Scripts\activate.bat" "%USERPROFILE%\miniconda3"
conda remove --name NeoSR --all
```

***
