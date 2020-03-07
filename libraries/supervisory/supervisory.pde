// Processing tool for building a supervisory

// Author: David Coelho
// Last Update: 2016-04-18

// Import Libraries

import processing.serial.*;

// Init Variables

Serial SerialPort = null;     // Serial Port Handle
String PortName = null;       // Get the port name from list of available ports
String SerialString = null;   // Get string from serial port

boolean conection = false;    // Recognize the extern platform
int [ ] values = null;        // Array of ints (values from serial)

Application app;              // Main application instance

int main_back_color = 240;    // main background color
int main_width = 1000;        // main application width
int main_height = 530;        // main application height
int freq = 50;                // Application's main loop frequence
                              // In this case, (50 Hz) or each 20 ms

// Initialize Interface
Application app_init()
{
  // Application Object (current screen initialy 0)
  Application new_app = new Application();
  
  // Add Screens to application
  new_app.add_screen(screen_sample(0));
  
  // Return application
  return new_app;
}

// Program Boot (Initialization)
void setup() 
{
// Define Screen Size
  size(main_width,main_height);
  
  // Drawning update frequency
  frameRate(freq);
  
  // Define Background Color
  background(main_back_color);
  
  // Text Settings
  textSize(12);
  
  // Alloc interface and it's screens
  app = app_init();
  
  // Create Serial Handle using the first available port at list
  printArray(Serial.list());
  PortName = Serial.list()[0];
  //PortName = "COM3"; // when there is more than one serial, force it to an specific COM
  SerialPort = new Serial(this,PortName,9600,'N',8,1);
  SerialPort.bufferUntil('\n'); // just call serial event when a '\n' is received
}

// Main Loop (repeats indefinitely)
void draw()
{
  // clear window with white background
  background(240);

  // paint current screen
  app.paint();
  
  // Handle timer events
  timerEvent();
}

// Serial Interruption
void serialEvent(Serial SerialPort) 
{
  // read buffer until reach char '\n'
  SerialString = SerialPort.readStringUntil('\n');
  
  // show string for debugging
  println(SerialString);
  
  // if find any '\n' at string
  if (SerialString != null)
  {
    // Print received string at console (just for debug)
    println(SerialString);
    
    // remove spaces of string
    SerialString = trim(SerialString);
    
    // Try to stablish conection
    if (conection == false)
    {
      if(SerialString.equals("Ola"))
      {
        SerialPort.clear();    // clear serial buffer
        conection = true;      // signals that connection was stablished
        SerialPort.write('A'); // send a byte to the uC 
        println("contact");    // just for debug
      }
    }
    else // if connection was already stablished
    {
      // just to add a protection
      if(!SerialString.equals("Ola"))
      {
        // get each value of string
        values = int(split(SerialString,','));
        
        // Shows each value (just for debug)
        for (int i = 0; i < values.length; i++)
          println(values[i]);
      
      } // end if equals ola
    } // end else connection
  } // end serialString != null
  
  // Call serial events
  app.serial_event(app);
}

// Timer Interruption 
void timerEvent ()
{
  app.timer_event(app);
}

// Keyboard Interruption
void keyPressed()
{
  app.key_event(app);
}

// Mouse Interruption 1
void mousePressed()
{
  app.mouse_event(app, MouseEv.press);
}

// Mouse Interruption 2
void mouseClicked()
{
  app.mouse_event(app, MouseEv.click);
}

// Mouse Interruption 3
void mouseMoved()
{
  app.mouse_event(app, MouseEv.move);
}
