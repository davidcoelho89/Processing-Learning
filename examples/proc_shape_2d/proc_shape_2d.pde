// Create 2d General Shapes

// Author: David Coelho
// Last Update: 2016-04-18

// Import Libraries

// Don't need new libraries for this example

// Init Variables

// Program Boot (Initialization)
void setup() 
{
  // Define Screen Size
  size(300,300); // size(wid,hei)
  
  // Define Alliased Design
  smooth();
  
  // Define Background Color
  background(128);
  
  // Define fill and Stroke for all Shapes (could be defined separatedly)
  stroke(0);       // black
  strokeWeight(2); // stroke thickness
  fill(255);       // white
}

// Main Loop (repeats indefinitely)
void draw()
{
  // Paint each shape defining its position

  point(30,10);                       // point(x,y); or point(x,y,z);
  line(50,10,80,40);                  // line(x1,y1,x2,y2);
  rect(10,70,30,30,1);                // rect(x,y,w,h,rad); rad = radius of borders
  triangle(70,100,110,100,90,70);     // triangle(x1,y1,x2,y2,x3,y3);
  quad(130,30,170,10,200,60,185,80);  // quad(x1, y1, x2, y2, x3, y3, x4, y4)
  ellipse(150,150,70,40);             // ellipse(x,y,w,h);
  
  // Paint each arch with diferent ways
  // arc(x, y, w, h, start, stop, mode);
  
  arc(050,220,60,60, 0, PI, OPEN);
  arc(130,220,60,60, 0, PI+HALF_PI, CHORD);
  arc(220,220,60,60, 0, PI+QUARTER_PI, PIE);
    
}
