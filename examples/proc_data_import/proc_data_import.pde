// Import bytes from a file

// Author: David Coelho
// Last Update: 2016-04-18

// Import Libraries

// Don't need new libraries for this example

// Init Variables

String[] lines;

// Program Boot (Initialization)
void setup() 
{
  // Define Screen Size
  size(500,500); // size(wid,hei)
  
  // Define Background Color
  background(128);
  
  // Execute draw just once
  noLoop();
}

// Main Loop (repeats indefinitely)
void draw()
{
  // Get data from a text file
  lines = loadStrings("data2.txt");
  println("there are " + lines.length + " lines");
  println(lines);
  
  // Get data from a web site
  lines = loadStrings("https://processing.org/overview/index.html");
  println("there are " + lines.length + " lines");
  for (int i = 0 ; i < lines.length; i++)
    println(lines[i]);
    
  // Close canvas
  exit();
}
