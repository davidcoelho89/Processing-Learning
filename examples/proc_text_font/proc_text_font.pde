// Text Handling (font, size and position)

// Author: David Coelho
// Last Update: 2016-04-18

// Import Libraries

// Don't need new libraries for this example

// Init Variables

PFont font1;
PFont font2;
PFont font3;
String string1 = "Processing";

// Program Boot (Initialization)
void setup() 
{
  // Define Screen Size
  size(500,500); // size(wid,hei)
  
  // Define Background Color
  background(128);

  // Uncomment the following two lines to see the available fonts 
  //String[] fontList = PFont.list();
  //printArray(fontList);
  
  // Create fonts from internal and external files
  font1 = createFont("Arial",16,true);   // Arial, size 16, anti-aliasing on
  font2 = loadFont("AngsanaNew-48.vlw"); // get font AngsanaNew from file
  font3 = createFont("Georgia",20,true); // Georgia, size 20, anti-aliasing on
  
  // Run draw() function just one time
  noLoop();
}

// Main Loop (repeats indefinitely)
void draw()
{
  // Draw a center line
  stroke(175);
  line(width/2,0,width/2,height);
  
  // Define the font to be used
  textFont(font1);  // define font
  textSize(36);     // define size
  textAlign(LEFT);  // alignment
  fill(255);        // define color
  
  // Uncomment the following two lines to see translation and rotation of strings
  // translate(width/2,height/2);  // Translate to the center
  // rotate(PI/2);                 // Rotate by PI/2
  
  // To see how to write curved text, access:
  // https://processing.org/tutorials/text/
  
  // Print text
  text(string1,0,30,150,150);  // text(string,x,y,wid,hei);
  println(textWidth(string1)); // Get text width
  
  // Define the font to be used
  textFont(font2);  // font
  textSize(48);     // size
  textAlign(RIGHT); // alignment
  fill(0);          // define color
  
  // Print text
  text(string1,0,110,300,200);
  println(textWidth(string1)); // Get text width
  
  // Define the font to be used
  textFont(font3);   // font
  textSize(18);      // size
  textAlign(CENTER); // alignment
  fill(255);         // define color
  
  // Print text
  text(string1,0,140,300,200);
  println(textWidth(string1)); // Get text width
}
