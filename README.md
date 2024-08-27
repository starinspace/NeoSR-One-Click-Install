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

![Installation Process](https://github.com/starinspace/NeoSR-One-Click-Install/assets/56514044/1a3fd2bf-0253-47de-8d9e-1671c90bb31f)

***

### **Running NeoSR**

1. Move the **run-neosr.bat** file to the NeoSR installation directory. Execute **run-neosr.bat** to launch NeoSR via the command line. From there, you can **paste the file path** or **drag-and-drop** the desired file into the command prompt to specify your [training toml file](https://github.com/muslll/neosr/tree/master/options).

![Running NeoSR](https://github.com/starinspace/NeoSR-One-Click-Install/assets/56514044/4225a641-1e20-4abd-83b6-0ed36a435ad4)

***

### **Updating NeoSR**

1. To update NeoSR to the latest version, simply run **update-neosr.bat**. This will download the latest release and update any necessary dependencies.

***

### **Having problem with enviroment in conda**

Have you installed from earlier One-Click-Install, you might need to remove the old enviroment, go to CMD and use this command:

```cmd
call "%USERPROFILE%\miniconda3\Scripts\activate.bat" "%USERPROFILE%\miniconda3"
conda remove --name NeoSR --all
conda create --name NeoSR 
```
