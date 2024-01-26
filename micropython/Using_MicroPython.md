# MicroPython

## Install MicroPython interpreter on STM32 discovery board

+ Download the [firmware](http://micropython.org/download#stm32) for your board (you can find a current copy for STM32L475EIOT01A inside `./micropython` folder)
+ Install stm-tools on your computer (`sudo apt install stm-tools` on Ubuntu)
+ Connect your board to your computer

    ```
    # Optional erase to clear existing filesystem.
    st-flash erase

    # Flash .hex
    st-flash --format ihex write B_L475E_IOT01A-20240105-v1.22.1.hex
    ```
+ __Press the reset button__

> Now the interpreter is ready! You can connect to the board using the serial port (e.g. `screen /dev/ttyACM0 115200`) and start coding!

## Prepare the code and run the example

https://github.com/micropython/micropython/tree/master/tools/mpremote

`mpremote` is a tool for controlling MicroPython boards over a serial connection. 

+ Let's make a first test and transmit a one-liner to the board

    ```bash 
    > mpremote exec "import micropython; micropython.mem_info()"
    stack: 484 out of 29688
    GC: total: 86976, used: 1456, free: 85520
    No. of 1-blocks: 15, 2-blocks: 7, max blk sz: 40, max free sz: 5333
    ```

+ Now let's send a file to the board. The following python code is included in `./micropython/MicroPythonExample.py`

    ```python helloWorld.py
    print("Hello, STM32!")

    import pyb
    import time

    print ("LEDs with MicroPython is easy")
    led = pyb.LED (1)

    led_counter = 0
    while 1: # Create an infinite loop
        led.on()
        time.sleep_ms (500) 
        led.off()
        time.sleep_ms (500) 
    ```

    The first command copies the file to the board. The second command executes the file on the board, it monitors the serial interface too.

    ```bash
    mpremote fs cp MicroPythonExample.py :MicroPythonExample.py
    mpremote run MicroPythonExample.py
    ```