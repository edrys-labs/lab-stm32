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
    printf("Programming ARM Controler with mbed is cool\r\n");
    while (true) {
        led = !led;
        if (led)
            printf("LED ON\r\n");
        else
            printf("LED OFF\r\n");
        ThisThread::sleep_for(BLINKING_RATE);
    }
}