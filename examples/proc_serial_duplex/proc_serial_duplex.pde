// Serial Write/Read (send and get data)

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

Serial SerialPort = null;     // Serial Port Handle
String PortName = null;       // Get the port name from list of available ports
String SerialString = null;   // Get string from serial port

int [ ] values = null;        // Array of ints
char whichKey = ' ';          // Variable to hold keystoke values

boolean conection = false;    // Recognize the extern platform

// Program Boot (Initialization)
void setup() 
{
  // Define Screen Size
  size(500,500); // size(wid,hei)
  
  // Define Background Color
  background(128);
  
  // Define the font from the available ones of the system
  PFont myFont = createFont(PFont.list()[2], 14);
  textSize(12);
  textFont(myFont);
  
  // Create Serial Handle using the first available port at list
  printArray(Serial.list());
  PortName = Serial.list()[0];
  SerialPort = new Serial(this,PortName,9600,'N',8,1);
  SerialPort.bufferUntil('\n'); // just call serial event when a '\n' is received
}

// Main Loop (repeats indefinitely)
void draw()
{
  // Clear canvas
  background(128);
  
  // Print char received and sent
  text("Last string received: " + SerialString, 10, 130);
  text("Last byte sent: " + whichKey, 10, 100);
}

void keyPressed()
{
  // get last key pressed
  whichKey = (char)key;

  // Send the keystroke out:
  SerialPort.write(key);
}

void serialEvent(Serial SerialPort) 
{
  // read buffer until reach char '\n'
  SerialString = SerialPort.readStringUntil('\n');
  
  // show string for debugging
  println(SerialString);
  
  // if find any '\n' at string
  if (SerialString != null)
  {
    // Print received string (just for debuggin)
    println(SerialString);
    
    // remove spaces of string
    SerialString = trim(SerialString);
    
    // Try to stablish conection
    if (conection == false)
    {
      if(SerialString.equals("Ola"))
      {
        SerialPort.clear();
        conection = true;
        SerialPort.write('A');
        println("contact"); // just for debugging
      }
    }
    else // if connection was already stablished
    {
      // just to add a protection
      if(!SerialString.equals("Ola"))
      {
        // get each value of string
        values = int(split(SerialString,','));
        
        // Shows each value
        for (int i = 0; i < values.length; i++)
          println(values[i]);
      
      } // end if equals ola
    } // end else connection
  } // end serialString != null
}// end serial event

