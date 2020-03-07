// Serial Read (get data)

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

Serial myPort;      // The serial port handle
PFont myFont;       // The font handle
char inByte = ' ';  // Incoming serial data

// Program Boot (Initialization)
void setup() 
{
  // Define Screen Size
  size(500,500); // size(wid,hei)
  
  // Define Background Color
  background(128);
  
  // Define the font from the available ones of the system
  myFont = createFont(PFont.list()[2], 14);
  textFont(myFont);
  
  // Create Serial Handle using the first available port at list
  printArray(Serial.list());
  String portName = Serial.list()[0];
  myPort = new Serial(this,Portname,9600,'N',8,1);
}

// Main Loop (repeats indefinitely)
void draw()
{
  // Erase background
  background(128);
  
  // Checks if there is any available byte at serial buffer
  if (myPort.available() > 0)
  {
    // read first serial buffer byte
    inByte = (char)myPort.read();
  }
  
  // Print char received
  text("Last char received: " + inByte, 10, 130);
}
