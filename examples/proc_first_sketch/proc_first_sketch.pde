// Fist Example in Processing

// Author: David Coelho
// Last Update: 2016-04-18

// Import Libraries

// Don't need new libraries for this example

// Init Variables

color c1 = color(128);

// Program Boot (Initialization)
void setup() 
{
  // Define Color Mode
  colorMode(RGB,255,255,255,255); // from 0 (empty/black) to 255 (full/white)
  
  // Define Alliased Design
  smooth();
  
  // Define fps of draw
  frameRate(50); // 50 Hz
  
  // Define Screen Size
  size(200,200); // size(wid,hei)
  
  // Define Background Color
  background(c1);
}

// Main Loop (repeats indefinitely)
void draw()
{
  // Print to Console
  print("Current Frame: " + frameCount + " ");  // print to console without '\n'
  println("Frame Rate: " + frameRate + " ");    // print to console with '\n'

  // Date and Time functions
  println("Date: " + day() + " " + month() + " " + year());
  println("Clock: " + hour() + " " + minute() + " " + second());

  // Wait given time in ms
  delay(1000);
}
