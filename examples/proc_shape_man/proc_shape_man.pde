// Shape Manipulation

// Author: David Coelho
// Last Update: 2016-04-18

// Import Libraries

// Don't need new libraries for this example

// Init Variables

// Program Boot (Initialization)
void setup()
{
  size(200,200);
}

// Main Loop (repeats indefinitely)
void draw()
{
  pushMatrix();
  translate(100,100);         //moves a matrix origin to X,Y
  scale(0.5);                 // scale a matrix by 50%
  rotate(second()/2);         // rotates a matrix by N radians
  noStroke();
  fill(second()*4,0,hour());
  rectMode(CENTER);
  rect(0,0,100,100);
  popMatrix();
}
