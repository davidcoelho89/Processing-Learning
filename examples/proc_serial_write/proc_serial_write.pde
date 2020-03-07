// Serial Write (sending bytes)

// Author: David Coelho
// Last Update: 2016-04-18

// Import Libraries

import processing.serial.*;

// Main function: Serial(parent, portName, baudRate, parity, dataBits, stopBits)
// parent      = PApplet (use "this")
// portName    = String: name of the port (COM1 default)
// baudRate    = int: (9600 default)
// parity      = char: 'N' none, 'E' even, 'O' odd, 'M' mark, 'S' space ('N' default)
// dataBits    = int: (8 default)
// stopBits    = float: 1.0, 1.5, or 2.0 (1.0 is default)

// Init Variables

Serial myPort;        // Create object from Serial class
char whichKey = ' ';  // Variable to hold keystoke values

// Program Boot (Initialization)
void setup() 
{
  // Define Screen Size
  size(500,500); // size(wid,hei)
  
  // Define Background Color
  background(128);
  
  // create a font with the third font available to the system:
  PFont myFont = createFont(PFont.list()[2], 14);
  textFont(myFont);
  
  // List all the available serial ports:
  printArray(Serial.list());
  
  // Define Serial Settings
  String portName = Serial.list()[0];
  myPort = new Serial(this,Portname,9600,'N',8,1);
}

// Main Loop (repeats indefinitely)
void draw()
{
  // Clear canvas
  background(128);
  
  // Show last key sent
  text("Last Sent: " + whichKey, 10, 100);
}

void keyPressed()
{
  // get last key pressed
  whichKey = key;

  // Send the keystroke out:
  myPort.write(key);
}

