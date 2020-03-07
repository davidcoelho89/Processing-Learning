// ScrollBar Class

// Author: David Coelho
// Last Update: 2016-04-18

// Static Variables

// Static Methods

// Implementation

class ScrollBar extends Control
{
  
  // Atributtes
  
  boolean is_horizontal;
  int knob_pos = 35; //goes from 0 to 70 (%)
  
  // Methods
  
  ScrollBar(int xpos, int ypos, int wid, int hei, boolean horizontal)
  {
    super(xpos, ypos, wid, hei);
    is_horizontal = horizontal;
  }
  
  void paint()
  {
    // paint background
    fill(255); // white fill
    stroke(0); // black border
    rect(x, y, w, h, 3);
    
    if (is_horizontal)
    {
    // paint squares

    // paint triangles
    
    // paint knob
  
    }
    else
    {
    // paint squares
    fill(128); stroke(0);
    rect(x,y,w,h/10);
    rect(x,y+h-h/10,w,h/10);
    
    // paint triangles
    fill(50); stroke(0);
    triangle(x+2,y+h/10-2,x+w-2,y+h/10-2,x+w/2,y+2);
    triangle(x+2,y+h-h/10+2,x+w-2,y+h-h/10+2,x+w/2,y+h-2);
    
    // paint knob
    fill(128); stroke(0);
    rect(x,y+h/10+(knob_pos*h)/100,w,h/10);
    }
    
  }
  
}
