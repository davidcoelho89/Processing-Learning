// Keyboard Handling

// Author: David Coelho
// Last Update: 2016-04-18

// Import Libraries

// Don't need new libraries for this example

// Init Variables

char whichKey = ' ';         // Variable to hold keystoke values
int whichCode = 0;           // Variable to hold keycode values
boolean key_rel = true;      // indicates if the key was released
boolean is_key_cod = false;  // indicates if the key is coded
PFont myFont;                // The font handle

// Program Boot (Initialization)
void setup() 
{
  // Define Screen Size
  size(500,500);
  
  // Define the font from the available ones of the system
  myFont = createFont(PFont.list()[2], 14);
  textFont(myFont);
  
  // Define Background Color
  background(128);
}

// Main Loop (repeats indefinitely)
void draw()
{
  
  // Clear canvas
  background(128);
  
  // Print Information
  text("Last key pressed: " + whichKey, 10, 130);
  text("Is last key coded? " + is_key_cod, 10, 160);
  text("Last key code: " + whichCode, 10, 190);
  text("Key released: " + key_rel, 10, 220);
  text("Key pressed: " + keyPressed, 10, 250);
}

void keyPressed()
{
  whichKey = key;
  whichCode = keyCode;
  key_rel = false;
  is_key_cod = (key == CODED);
}

void keyReleased()
{
  key_rel = true;
}
