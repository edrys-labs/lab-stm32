print("Hello, STM32!")

import pyb
import time

print ("LEDs with MicroPython is easy")
led = pyb.LED (1)

led_counter = 0
while 1: # Create an infinite loop
    led.on()
    print("LED ON_")
    time.sleep_ms (500) 
    led.off()
    print("LED OFF_")
    time.sleep_ms (500) 