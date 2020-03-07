// Create a Graphic object in processing

// Author: David Coelho
// Last Update: 2016-04-18

// Init Variables

PGraphics pg;

// Program Boot (Initialization)
void setup() 
{
  // Set size of canvas
  size(640, 360);
  
  // Set size of graphic object
  pg = createGraphics(400, 200);
}

// Main Loop (repeats indefinitely)
void draw() 
{
  // Paint canvas
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  noStroke();
  ellipse(mouseX, mouseY, 60, 60);
  
  // Construct graphic object
  pg.beginDraw();
  pg.background(51);
  pg.noFill();
  pg.stroke(255);
  pg.ellipse(mouseX-120, mouseY-60, 60, 60);
  pg.endDraw();
  
  // Put the object at canvas with image function
  image(pg, 120, 60); 
}
