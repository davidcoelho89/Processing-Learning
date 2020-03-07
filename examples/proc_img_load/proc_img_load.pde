// Example of Image Loading

// Author: David Coelho
// Last Update: 2016-04-18

// Import Libraries

// Don't need new libraries for this example

// Init Variables

PImage background_img;    // Image Handler
int canvas_width = 420;
int canvas_height = 200;

// Program Boot (Initialization)
void setup()
{
  // Define Screen Size
  size (canvas_width,canvas_height);
  
  // Define Background Color
  background(0);
  
  // Load image to image handler
  background_img = loadImage("image1.jpg");

  // Dont modify image colors
  noTint();
  
  // Paint image at canvas // image (img,x,y,width,height);
  image(background_img, 0, 0, canvas_width, canvas_height);
}

// Main Loop (repeats indefinitely)
void draw()
{
  // Dont need code here
}
