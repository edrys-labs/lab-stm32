# Running codes from different languages on STM32 discovery board 

This is a tutorial on how to run codes from different languages on STM32 discovery board. All steps - preparing the system, compiling the code, flashing the board and monitoring the outputs on UART - are implemented in command line. The tutorial is based on Ubuntu 22.04 LTS.

The subfolders include the description of the installation process and a `Hello World` example for

+ [MicroPython](https://github.com/SebastianZug/STM_programming_by_CLI/blob/main/arduino/Using_Arduino.md) using `st-flash` and `mpremote`
+ [mbedOS](https://github.com/SebastianZug/STM_programming_by_CLI/blob/main/mbedOS/Using_mbedOS.md) based on `mbed-tools` (mbed CLI 2.0)
+ [Arduino](https://github.com/SebastianZug/STM_programming_by_CLI/blob/main/arduino/Using_Arduino.md) using `arduino-cli`

The commandline tools of the first two programming languages require `python3` and `pip3` as well as `pipenv` to be installed on your system. The installation process of the specific packages is initiated by starting an `pipenv` environment within the corresponding folder.  For instance, to start the `pipenv` environment for MicroPython, run the following commands:

```bash
> cd micropython
> pipenv shell
Creating a virtualenv for this project...
Pipfile: /home/sebastian/Desktop/Python/stm_multilanguage/micropython/Pipfile
Using /usr/bin/python3 (3.10.12) to create virtualenv...
⠹ Creating virtual environment...created virtual environment CPython3.10.12.final.0-64 in 102ms
  creator CPython3Posix(dest=/home/sebastian/.local/share/virtualenvs/micropython-hm3a3fmn, clear=False, no_vcs_ignore=False, global=False)
  seeder FromAppData(download=False, pip=bundle, setuptools=bundle, wheel=bundle, via=copy, app_data_dir=/home/sebastian/.local/share/virtualenv)
    added seed packages: pip==23.3.2, setuptools==69.0.3, wheel==0.42.0
  activators BashActivator,CShellActivator,FishActivator,NushellActivator,PowerShellActivator,PythonActivator

✔ Successfully created virtual environment! 
```

Happy coding!
