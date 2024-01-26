# Using Mbed OS 6

The mbed-cli 2.0 is a Python-based command-line tool. Its documentation can be found [here](https://os.mbed.com/docs/mbed-os/v6.16/build-tools/use.html).

## Installation

+ Install an ARM compiler on your system. Two a directly suported by mbed-tools: ARM GCC and Keil compiler

    ```
    sudo apt update                                                
    sudo apt install gcc-arm-none-eabi -y
    sudo apt install gcc-arm-linux-gnueabihf -y
    sudo apt install gcc-aarch64-linux-gnu -y
    ```

+ Ninja build system

    ```
    sudo apt update 
    sudo apt-get install ninja-build
    ```

## Project generation and compilation

+ Create a new project with `mbed-tools` and change into the project folder

    ```bash 
    > mbed-tools new mbedOSExample
    > cd mbedOSExample
    ```

+ Replace the content of `main.cpp` with the following code

    ```cpp
    /* mbed Microcontroller Library
    * Copyright (c) 2019 ARM Limited
    * SPDX-License-Identifier: Apache-2.0
    */

    #include "mbed.h"

    // Blinking rate in milliseconds
    #define BLINKING_RATE     500ms

    int main()
    {
        DigitalOut led(LED1);

        while (true) {
            led = !led;
            if (led)
                printf("LED ON\r\n");
            else
                printf("LED OFF\r\n");
            ThisThread::sleep_for(BLINKING_RATE);
        }
    }
    ```

+ Flash the board and monitoring the output of the `HelloWorld` example above

    ```bash
    mbed-tools compile -m DISCO_L475VG_IOT01A -t GCC_ARM -f --sterm
    ```