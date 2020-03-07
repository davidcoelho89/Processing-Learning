// Example of image manipulation

// Author: David Coelho
// Last Update: 2016-04-18

// Import Libraries

// Don't need new libraries for this example

// Init Variables

PImage background_img;    // Image Handler
int canvas_width = 420;
int canvas_height = 200;
int index = 0;

// Program Boot (Initialization)
void setup() 
{
  // Define Screen Size
  size (canvas_width,canvas_height);
  
  // Define Background Color
  background(0);
  
  // Load image to image handler
  background_img = loadImage("image1.jpg");

  // Draw is executed only once
  noLoop();
}

// Main Loop (repeats indefinitely)
void draw()
{
  // Clear Background
  background(255);
  
  // Paint image at canvas // image (img,x,y,width,height);
  image(background_img, 0, 0, canvas_width, canvas_height);
  
  // The filter functions must be after image painting
  
  // Choose option
  switch(index)
  {
    case 0:
      // Dont modify image colors
      noTint();
      // Image must be painted after noTint() command
      image(background_img, 0, 0, canvas_width, canvas_height);
      break;
    case 1:
      // Tint image
      tint(74,203,79);
      // Image must be painted after Tint() command
      image(background_img, 0, 0, canvas_width, canvas_height);
      break;
    case 2:
      filter(THRESHOLD);
      break;
    case 3:
      filter(GRAY);
      break;
    case 4:
      filter(OPAQUE);
      break;
    case 5:
      filter(INVERT);
      break;
    case 6:
      filter(POSTERIZE,4);
      break;
    case 7:
      filter(BLUR,6);
      break;
    case 8:
      filter(ERODE);
      break;
    case 9:
      filter(DILATE);
      break;
  }
  
}

void mouseClicked() 
{
  // treat image
  index++;
  if(index > 9)
    index = 0;
    
  // Execute draw another time
  redraw();
}
