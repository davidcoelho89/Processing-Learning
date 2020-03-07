// Application Class

// Author: David Coelho
// Last Update: 2016-04-18

// Static Variables

// Static Methods

// Implementation

class Graphic extends Control
{
  // Atributtes
  
  boolean drawing_on = false;
  int[] values;
  int min_value;
  int max_value;
  int last_value;
  int last_time;
  int count;
  
  // Methods
  
  Graphic(int xpos, int ypos, int wid, int hei, int min, int max)
  {
    super(xpos, ypos, wid, hei);
    min_value = min;
    max_value = max;
    last_value = min;
    count = 0;
    last_time = 0;
    values = new int[wid];
    for (int i = 0; i < values.length; i++)
      values[i] = 0;
  }
  
  void paint()
  {
    fill(255); // white fill
    stroke(0); // black border
    rect(x, y, w, h, 3);

    if(drawing_on == true)
    {
      // update all values
      if (count >= w){
        for(int i = 0; i < values.length - 1; i++){
          values[i] = values[i+1];
        }
        values[values.length - 1] = ((last_value - min_value)*h) / (max_value - min_value);
      }
      
      // update just next value
      else{
        values[count] = ((last_value - min_value)*h) / (max_value - min_value);
        count++;
      }
      
      // paint lines
      for (int i = 1; i < values.length; i++){
        if (i != count)
          line(i-1+x, y + h - values[i-1], i+x, y + h - values[i]);
      }
    }
  }
  
  void update_value(int value)
  {
    if(value > max_value)
      last_value = max_value;
    else if (value < min_value)
      last_value = min_value;
    else
      last_value = value;
  }
  
  void start_stop_drawning(boolean choice)
  {
    drawing_on = choice;
    if (choice)
      last_time = millis();
  }
  
  void restart_graphic()
  {
    drawing_on = true;
    count = 0;
    for (int i = 0; i < values.length; i++)
      values[i] = 0;
  }
  
}
