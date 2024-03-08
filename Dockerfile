FROM crosslab/edrys_pyxtermjs:latest

#ensure we are root for software install
USER root

RUN apt-get update && apt-get upgrade -y

# install required packages
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    stlink-tools \
    cmake \
    libusb-1.0-0-dev \
    gcc-arm-none-eabi \
    gcc-arm-linux-gnueabihf \
    gcc-aarch64-linux-gnu \
    ninja-build \
    make \
    git \
    mercurial \
    pip

# This is required for installation, flashing, serial communication and debugging of the STM32
RUN DEBIAN_FRONTEND=noninteractive pip install plotext \
    pyserial \
    mbed-tools \
    mbed-cli \
    mpremote

# prepare arduino-cli for container (install as root)
RUN cd / && curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
#
RUN arduino-cli upgrade && arduino-cli core update-index
#
RUN arduino-cli core install \
    STMicroelectronics:stm32 \
    --additional-urls https://github.com/stm32duino/BoardManagerFiles/raw/main/package_stmicroelectronics_index.json

## install arduino-cli libraries
RUN arduino-cli lib install \
    "LiquidCrystal" \
    "LiquidCrystal_PCF8574" 

COPY ./local_run /local_run

# ensure we are switched to user Switch to user we must not set group to make the configuration done above apply
# !! if ${user} is not setup correctly the next line might result in group being root !!
USER ${user}

#ENTRYPOINT python3 -m /var/www/pyxtermjs --cors True --host 0.0.0.0 --command zsh 