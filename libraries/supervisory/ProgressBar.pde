// Progress Bar Class

// Author: David Coelho
// Last Update: 2016-04-18

// Static Variables

// Static Methods

// Implementation

class ProgressBar extends Control
{
  // Atributtes
  
  boolean is_horizontal;
  int curr_value;
  int min_value;
  int max_value;
  
  // Methods
  
  ProgressBar(int xpos, int ypos, int wid, int hei, int min, int max, boolean horizontal)
  {
    super(xpos, ypos, wid, hei);
    is_horizontal = horizontal;    
    min_value = min;
    max_value = max;
    curr_value = min_value;
  }
  
  void paint()
  {
    // paint background
    fill(255); // white fill
    stroke(0); // black border
    rect(x, y, w, h, 3);
    
    // paint foreground
    fill(0);   // black fill
    stroke(0); // black border
    
    if(is_horizontal)
    {
      int progress_w = ((curr_value - min_value)*w)/(max_value - min_value);
      rect(x,y,progress_w,h,3);
    }
    else
    {
      int progress_h = ((curr_value - min_value)*h)/(max_value - min_value);
      int progress_y = y + h - progress_h;
      rect(x, progress_y, w, progress_h, 3);
    }
    
  }
  
  void update_value(int value)
  {
    if(value > max_value)
      this.curr_value = max_value;
    else if (value < min_value)
      this.curr_value = min_value;
    else
      this.curr_value = value;
  }
  
}
