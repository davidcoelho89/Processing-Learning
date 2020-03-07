// Create 3d General Shapes

// Author: David Coelho
// Last Update: 2016-04-18

// Import Libraries

// Don't need new libraries for this example

// Init Variables

int x = 300;
int grow = 1;

// Program Boot (Initialization)
void setup() 
{
  // Define Screen Size
  size(500,500,P3D);
  
  // Define Background Color
  background(128);
}

// Main Loop (repeats indefinitely)
void draw()
{
  // Clear canvas
  
  background(150);
  
  // print box
  
  pushMatrix();
  fill(255,0,0);
  translate(x,height/4);
  rotateX(millis()*0.001);
  rotateY(QUARTER_PI);
  box(25,25,second()*2);
  popMatrix();

  // print sphere
  
  pushMatrix();
  fill(0,255,0);
  translate(x,height*3/4);
  rotateX(millis()*0.001);
  rotateY(QUARTER_PI);
  sphere(25);
  popMatrix();
  
  // Logic of movement
  
  x = x + grow;
  
  if (x <= 0 || x >= width)
    grow = -1*grow;
  
}
