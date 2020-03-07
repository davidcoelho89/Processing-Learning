// Export Image to a file

// Author: David Coelho
// Last Update: 2016-04-18

// Import Libraries

import  processing.pdf.*;

// Init Variables

int canvas_wid = 200;
int canvas_hei = 200;
int flag = 0;

// Program Boot (Initialization)
void setup()
{
  // Example 1: Save and show image
  
  // Set canvas size
  size(canvas_wid,canvas_hei);
  // Draw lines
  line(0,0,width,height);
  line(width,0,0,height);
  // Two ways of saving in figure files
  save("linhas.jpg");
}

void draw()
{
  // Dont need code for this example
}

/*
  // Example 2: Just save image at pdf file. Dont show file.
  
  // Set canvas size and background
  size(600,600,PDF,"linha.pdf");
  background(255);
  // Draw line
  stroke(0);
  line(200,0,width/2,height);
  // finish canvas
  exit();
*/

/*
  // Example 3: Save image at pdf file. Show image
  
  // Set canvas size and background
  size(600, 600);
  background(255);
  // Draw line
  beginRecord(PDF,"line.pdf");
  stroke(0, 20);
  strokeWeight(20.0);
  line(200, 0, 400, height);
  endRecord();
*/
