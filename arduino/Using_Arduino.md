# Arduino C++

A nice overview of arduino-cli is given in a short [Tutorial](https://www.youtube.com/watch?v=Uk5_RKMf2Dk).

## Install Arduino CLI 

+ Download the [Arduino CLI](ttps://arduino.github.io/arduino-cli/0.21/installation/) for your OS. We added a current copy inside to this folder.
+ Check its availability with `./arduino-cli version`

    ```bash
    > arduino ./arduino-cli version                                                 

    arduino-cli  Version: 0.35.1 Commit: 5edfa984 Date: 2024-01-16T14:50:44Z
    ```

## Install the STM tools and libraries

+ Install the STM32 core with `./arduino-cli core install STMicroelectronics:stm32 --additional-urls https://github.com/stm32duino/BoardManagerFiles/raw/main/package_stmicroelectronics_index.json`
+ Check the installation with `./arduino-cli core list` - the output contain several STM boards  
+ Create a new sketch with `./arduino-cli sketch new arduinoExample`
+ Copy the following code into the `arduinoExample.ino` file

    ```cpp
    /*
    Blink

    Turns an LED on for one second, then off for one second, repeatedly.

    Most Arduinos have an on-board LED you can control. On the UNO, MEGA and ZERO
    it is attached to digital pin 13, on MKR1000 on pin 6. LED_BUILTIN is set to
    the correct LED pin independent of which board is used.
    If you want to know what pin the on-board LED is connected to on your Arduino
    model, check the Technical Specs of your board at:
    https://www.arduino.cc/en/Main/Products

    modified 8 May 2014
    by Scott Fitzgerald
    modified 2 Sep 2016
    by Arturo Guadalupi
    modified 8 Sep 2016
    by Colby Newman

    This example code is in the public domain.

    https://www.arduino.cc/en/Tutorial/BuiltInExamples/Blink
    */

    // the setup function runs once when you press reset or power the board
    void setup() {
    // initialize digital pin LED_BUILTIN as an output.
    pinMode(LED_BUILTIN, OUTPUT);
    Serial.begin(9600);
    }

    // the loop function runs over and over again forever
    void loop() {
    digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
    Serial.println("LED ON");
    delay(1000);                       // wait for a second
    digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
    Serial.println("LED OFF");
    delay(1000);                       // wait for a second
    }
    ```

## Apply the toolchain to the example

+ Do not be confused if your board is not recognized correctly when running `./arduino-cli board list`. We have to reference its type manually.

    ```bash 
    > arduino ./arduino-cli board list         

    Port         Protocol Type              Board Name FQBN Core
    /dev/ttyACM0 serial   Serial Port (USB) Unknown
    ```

+ Compile the example 

    ```bash
    > ./arduino-cli compile --fqbn=STMicroelectronics:stm32:Disco:pnum=B_L475E_IOT01A arduinoExample --build-path=./arduinoBuild
    ```

+ Upload the example 

    ```bash
    > ./arduino-cli upload arduinoExample --fqbn=STMicroelectronics:stm32:Disco:pnum=B_L475E_IOT01A -p=/dev/ttyACM0 --input-dir=./arduinoBuild
    ```

+ Monitor the example 

    ```bash
    > ./arduino-cli monitor -p /dev/ttyACM0
    ```